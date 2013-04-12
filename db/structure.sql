CREATE TABLE `forem_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_forem_categories_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `forem_forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `category_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_forem_forums_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `forem_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_forem_groups_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `forem_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_forem_memberships_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `forem_moderator_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_forem_moderator_groups_on_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `forem_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `text` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT 'pending_review',
  `notified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_forem_posts_on_topic_id` (`topic_id`),
  KEY `index_forem_posts_on_user_id` (`user_id`),
  KEY `index_forem_posts_on_reply_to_id` (`reply_to_id`),
  KEY `index_forem_posts_on_state` (`state`),
  FULLTEXT KEY `fulltext_index` (`text`)
) ENGINE=MyISAM AUTO_INCREMENT=492 DEFAULT CHARSET=latin1;

CREATE TABLE `forem_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `forem_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  `last_post_at` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT 'pending_review',
  `views_count` int(11) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_forem_topics_on_slug` (`slug`),
  KEY `index_forem_topics_on_forum_id` (`forum_id`),
  KEY `index_forem_topics_on_user_id` (`user_id`),
  KEY `index_forem_topics_on_state` (`state`),
  FULLTEXT KEY `fulltext_index` (`subject`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

CREATE TABLE `forem_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `viewable_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `viewable_type` varchar(255) DEFAULT NULL,
  `current_viewed_at` datetime DEFAULT NULL,
  `past_viewed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_forem_views_on_user_id` (`user_id`),
  KEY `index_forem_views_on_topic_id` (`viewable_id`),
  KEY `index_forem_views_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `forem_admin` tinyint(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `forem_state` varchar(255) DEFAULT 'pending_review',
  `forem_auto_subscribe` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20111013062307');

INSERT INTO schema_migrations (version) VALUES ('20111013062827');

INSERT INTO schema_migrations (version) VALUES ('20111013062828');

INSERT INTO schema_migrations (version) VALUES ('20111013062829');

INSERT INTO schema_migrations (version) VALUES ('20111013062830');

INSERT INTO schema_migrations (version) VALUES ('20111013062831');

INSERT INTO schema_migrations (version) VALUES ('20111013062832');

INSERT INTO schema_migrations (version) VALUES ('20111013062833');

INSERT INTO schema_migrations (version) VALUES ('20111013062834');

INSERT INTO schema_migrations (version) VALUES ('20111013062835');

INSERT INTO schema_migrations (version) VALUES ('20111013063207');

INSERT INTO schema_migrations (version) VALUES ('20111018182005');

INSERT INTO schema_migrations (version) VALUES ('20130122133416');

INSERT INTO schema_migrations (version) VALUES ('20130122133417');

INSERT INTO schema_migrations (version) VALUES ('20130122133418');

INSERT INTO schema_migrations (version) VALUES ('20130122133419');

INSERT INTO schema_migrations (version) VALUES ('20130122133420');

INSERT INTO schema_migrations (version) VALUES ('20130122133421');

INSERT INTO schema_migrations (version) VALUES ('20130122133422');

INSERT INTO schema_migrations (version) VALUES ('20130122133423');

INSERT INTO schema_migrations (version) VALUES ('20130122133424');

INSERT INTO schema_migrations (version) VALUES ('20130122133425');

INSERT INTO schema_migrations (version) VALUES ('20130122133426');

INSERT INTO schema_migrations (version) VALUES ('20130122133427');

INSERT INTO schema_migrations (version) VALUES ('20130122133428');

INSERT INTO schema_migrations (version) VALUES ('20130122133429');

INSERT INTO schema_migrations (version) VALUES ('20130122133430');

INSERT INTO schema_migrations (version) VALUES ('20130122133431');

INSERT INTO schema_migrations (version) VALUES ('20130122133432');

INSERT INTO schema_migrations (version) VALUES ('20130122133433');

INSERT INTO schema_migrations (version) VALUES ('20130122133434');

INSERT INTO schema_migrations (version) VALUES ('20130122133435');

INSERT INTO schema_migrations (version) VALUES ('20130122133436');

INSERT INTO schema_migrations (version) VALUES ('20130412125930');
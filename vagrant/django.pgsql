--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.vle_groupmember DROP CONSTRAINT vle_groupmember_user_id_2a795a242d399aad_fk_auth_user_id;
ALTER TABLE ONLY public.vle_coursemember DROP CONSTRAINT vle_coursemember_user_id_f7a34c604ff6c54_fk_auth_user_id;
ALTER TABLE ONLY public.reversion_revision DROP CONSTRAINT reversion_revision_user_id_53d027e45b2ec55e_fk_auth_user_id;
ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT reversion__revision_id_48ec3744916a950_fk_reversion_revision_id;
ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT rever_content_type_id_c01a11926d4c4a9_fk_django_content_type_id;
ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refres_user_id_70e9e9b61f77a99b_fk_auth_user_id;
ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_user_id_6b82b307bca4e364_fk_auth_user_id;
ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_applic_user_id_2a1f6996100ae2dd_fk_auth_user_id;
ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesst_user_id_4a88adaf597c286_fk_auth_user_id;
ALTER TABLE ONLY public.messaging_messagetargetuser DROP CONSTRAINT messaging_messagetarge_user_id_2540b9670c45810a_fk_auth_user_id;
ALTER TABLE ONLY public.messaging_messageitem DROP CONSTRAINT messaging_messageitem_user_id_515057b70c439a25_fk_auth_user_id;
ALTER TABLE ONLY public.messaging_message DROP CONSTRAINT messaging_message_user_id_6fbb92de51aab142_fk_auth_user_id;
ALTER TABLE ONLY public.messaging_message DROP CONSTRAINT messaging_me_parent_id_4be47ed27403ca49_fk_messaging_message_id;
ALTER TABLE ONLY public.messaging_messageattachment DROP CONSTRAINT messaging_me_message_id_9bc1078ef91ad4c_fk_messaging_message_id;
ALTER TABLE ONLY public.messaging_messageitem DROP CONSTRAINT messaging_m_message_id_6c542d37d4419cb0_fk_messaging_message_id;
ALTER TABLE ONLY public.messaging_messagetargetuser DROP CONSTRAINT messaging_m_message_id_63e49e526eacd5cb_fk_messaging_message_id;
ALTER TABLE ONLY public.messaging_messagetargetgroup DROP CONSTRAINT messaging_m_message_id_4b1016ed5b77958c_fk_messaging_message_id;
ALTER TABLE ONLY public.messaging_messagetargetcourse DROP CONSTRAINT messaging_m_message_id_273a6b757d3b2e2d_fk_messaging_message_id;
ALTER TABLE ONLY public.cms_globalpagepermission_sites DROP CONSTRAINT e1f6e04d85328b41a00c7676eee76587;
ALTER TABLE ONLY public.djangocms_style_style DROP CONSTRAINT djangocms_cmsplugin_ptr_id_661880b8f081b307_fk_cms_cmsplugin_id;
ALTER TABLE ONLY public.djangocms_text_ckeditor_text DROP CONSTRAINT djangocms_cmsplugin_ptr_id_5cfb7ff7d38a35c0_fk_cms_cmsplugin_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_66c4fd751edb4af3_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT djan_content_type_id_3a013be961a57126_fk_django_content_type_id;
ALTER TABLE ONLY public.cms_usersettings DROP CONSTRAINT cms_usersettings_user_id_2cfe7a2128ccc2b3_fk_auth_user_id;
ALTER TABLE ONLY public.cms_usersettings DROP CONSTRAINT cms_userset_clipboard_id_15eac87d124304f3_fk_cms_placeholder_id;
ALTER TABLE ONLY public.cms_title DROP CONSTRAINT cms_title_publisher_public_id_74e956b52b3e4a1d_fk_cms_title_id;
ALTER TABLE ONLY public.cms_title DROP CONSTRAINT cms_title_page_id_527ebd61f3936a12_fk_cms_page_id;
ALTER TABLE ONLY public.cms_staticplaceholder DROP CONSTRAINT cms_staticplaceholde_site_id_65c8a138163af08f_fk_django_site_id;
ALTER TABLE ONLY public.cms_staticplaceholder DROP CONSTRAINT cms_staticplace_draft_id_6c2edc7f36488820_fk_cms_placeholder_id;
ALTER TABLE ONLY public.cms_staticplaceholder DROP CONSTRAINT cms_staticplac_public_id_20b32af3aef57809_fk_cms_placeholder_id;
ALTER TABLE ONLY public.cms_placeholderreference DROP CONSTRAINT cms_place_cmsplugin_ptr_id_57d93b52c864bee6_fk_cms_cmsplugin_id;
ALTER TABLE ONLY public.cms_pageusergroup DROP CONSTRAINT cms_pageusergroup_created_by_id_53218d1b0250196_fk_auth_user_id;
ALTER TABLE ONLY public.cms_pageusergroup DROP CONSTRAINT cms_pageusergrou_group_ptr_id_2fed9cde9e11700f_fk_auth_group_id;
ALTER TABLE ONLY public.cms_pageuser DROP CONSTRAINT cms_pageuser_user_ptr_id_7b1c6e2f6b58ccde_fk_auth_user_id;
ALTER TABLE ONLY public.cms_pageuser DROP CONSTRAINT cms_pageuser_created_by_id_18eb7aa0ce6f1c16_fk_auth_user_id;
ALTER TABLE ONLY public.cms_pagepermission DROP CONSTRAINT cms_pagepermission_user_id_b6429a51a3e8e53_fk_auth_user_id;
ALTER TABLE ONLY public.cms_pagepermission DROP CONSTRAINT cms_pagepermission_page_id_214a878c4fb6ec65_fk_cms_page_id;
ALTER TABLE ONLY public.cms_pagepermission DROP CONSTRAINT cms_pagepermission_group_id_39f298fdb5026_fk_auth_group_id;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_site_id_74f6849b7245e838_fk_django_site_id;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_publisher_public_id_6d3414df27b14e29_fk_cms_page_id;
ALTER TABLE ONLY public.cms_page_placeholders DROP CONSTRAINT cms_page_placeholders_page_id_2339fb692425adb6_fk_cms_page_id;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_parent_id_3a1df0ef76fe1197_fk_cms_page_id;
ALTER TABLE ONLY public.cms_page_placeholders DROP CONSTRAINT cms_page__placeholder_id_1e2710bd8c76d9ad_fk_cms_placeholder_id;
ALTER TABLE ONLY public.cms_placeholderreference DROP CONSTRAINT cms_p_placeholder_ref_id_6d7ea115a2f488ec_fk_cms_placeholder_id;
ALTER TABLE ONLY public.cms_globalpagepermission DROP CONSTRAINT cms_globalpagepermissi_user_id_5b7e387d572f1d18_fk_auth_user_id;
ALTER TABLE ONLY public.cms_globalpagepermission_sites DROP CONSTRAINT cms_globalpagepermis_site_id_2805b267618ef941_fk_django_site_id;
ALTER TABLE ONLY public.cms_globalpagepermission DROP CONSTRAINT cms_globalpagepermis_group_id_5495c04a8b715951_fk_auth_group_id;
ALTER TABLE ONLY public.cms_cmsplugin DROP CONSTRAINT cms_cmsplugin_parent_id_3227a3752b89b923_fk_cms_cmsplugin_id;
ALTER TABLE ONLY public.cms_cmsplugin DROP CONSTRAINT cms_cmspl_placeholder_id_45e08772be34ec0f_fk_cms_placeholder_id;
ALTER TABLE ONLY public.cms_aliaspluginmodel DROP CONSTRAINT cms_aliaspluginm_plugin_id_6cb0e8f62e7b802f_fk_cms_cmsplugin_id;
ALTER TABLE ONLY public.cms_aliaspluginmodel DROP CONSTRAINT cms_aliasp_cmsplugin_ptr_id_a146238a4a634c4_fk_cms_cmsplugin_id;
ALTER TABLE ONLY public.cms_aliaspluginmodel DROP CONSTRAINT cms_alias_placeholder_id_19ff87f4b6506f7d_fk_cms_placeholder_id;
ALTER TABLE ONLY public.into_oauth_oauthsignout DROP CONSTRAINT bcb3e675fea7f067e8892528f1e65c6d;
ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT b405dd8c9c5e3c19fd109e12693969f7;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissi_user_id_25c07bbaf4dad19_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_21201e2187b7c441_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_d801e79457ead29_fk_auth_group_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user__permission_id_5818e8dba4127031_fk_auth_permission_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permission_id_3790968156f739fd_fk_auth_permission_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permission_group_id_4ea7cc02b4e18eb_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_content_type_id_511077ac34725d8a_fk_django_content_type_id;
ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT a220b01f74675bbe389106551c467b30;
ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT "D98064d3cec57536c1270f8c9ddc9a6b";
ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT "D0483c88700614fd6c5c84b124583720";
DROP INDEX public.vle_groupmember_vle_group_id_10d29ad245cdd6aa_like;
DROP INDEX public.vle_groupmember_vle_course_id_504915309cf9cc53_like;
DROP INDEX public.vle_groupmember_e8701ad4;
DROP INDEX public.vle_groupmember_a02158e9;
DROP INDEX public.vle_groupmember_9309a986;
DROP INDEX public.vle_groupkvstore_vle_group_id_164858243ae234c5_like;
DROP INDEX public.vle_groupkvstore_vle_course_id_5f7c7fdd600996ce_like;
DROP INDEX public.vle_groupkvstore_a02158e9;
DROP INDEX public.vle_groupkvstore_9309a986;
DROP INDEX public.vle_coursemember_vle_course_id_26c38ed78d3f63fa_like;
DROP INDEX public.vle_coursemember_e8701ad4;
DROP INDEX public.vle_coursemember_a02158e9;
DROP INDEX public.vle_coursemember_37d6497a;
DROP INDEX public.vle_coursekvstore_vle_course_id_19f341026bee5e1f_like;
DROP INDEX public.reversion_version_5de09a8d;
DROP INDEX public.reversion_version_417f1b1c;
DROP INDEX public.reversion_version_0c9ba3a3;
DROP INDEX public.reversion_revision_manager_slug_54d21219582503b1_like;
DROP INDEX public.reversion_revision_e8701ad4;
DROP INDEX public.reversion_revision_c69e55a4;
DROP INDEX public.reversion_revision_b16b0f06;
DROP INDEX public.oauth2_provider_refreshtoken_token_3a528ed1e6b59ef_like;
DROP INDEX public.oauth2_provider_refreshtoken_e8701ad4;
DROP INDEX public.oauth2_provider_refreshtoken_94a08da1;
DROP INDEX public.oauth2_provider_refreshtoken_6bc0a4eb;
DROP INDEX public.oauth2_provider_grant_e8701ad4;
DROP INDEX public.oauth2_provider_grant_code_646e22a35107b303_like;
DROP INDEX public.oauth2_provider_grant_c1336794;
DROP INDEX public.oauth2_provider_grant_6bc0a4eb;
DROP INDEX public.oauth2_provider_application_e8701ad4;
DROP INDEX public.oauth2_provider_application_client_secret_7fe1e3e860384ff_like;
DROP INDEX public.oauth2_provider_application_client_id_4ea6f2a9d08e2e2e_like;
DROP INDEX public.oauth2_provider_application_9d667c2b;
DROP INDEX public.oauth2_provider_accesstoken_token_445c5877e7d791d6_like;
DROP INDEX public.oauth2_provider_accesstoken_e8701ad4;
DROP INDEX public.oauth2_provider_accesstoken_94a08da1;
DROP INDEX public.oauth2_provider_accesstoken_6bc0a4eb;
DROP INDEX public.messaging_messagetargetuser_e8701ad4;
DROP INDEX public.messaging_messagetargetuser_4ccaa172;
DROP INDEX public.messaging_messagetargetgroup_vle_group_id_650dfa7956350430_like;
DROP INDEX public.messaging_messagetargetgroup_vle_course_id_8acf15ecd51f6d9_like;
DROP INDEX public.messaging_messagetargetgroup_a02158e9;
DROP INDEX public.messaging_messagetargetgroup_9309a986;
DROP INDEX public.messaging_messagetargetgroup_4ccaa172;
DROP INDEX public.messaging_messagetargetcourse_a02158e9;
DROP INDEX public.messaging_messagetargetcourse_4ccaa172;
DROP INDEX public.messaging_messagetargetcour_vle_course_id_47995fa2b9f9cf38_like;
DROP INDEX public.messaging_messageitem_ecae1311;
DROP INDEX public.messaging_messageitem_e8701ad4;
DROP INDEX public.messaging_messageitem_da602f0b;
DROP INDEX public.messaging_messageitem_4ccaa172;
DROP INDEX public.messaging_messageattachment_4ccaa172;
DROP INDEX public.messaging_message_e8701ad4;
DROP INDEX public.messaging_message_caf7cc51;
DROP INDEX public.messaging_message_c9e9a848;
DROP INDEX public.messaging_message_789183b7;
DROP INDEX public.messaging_message_6be37982;
DROP INDEX public.messaging_message_656442a0;
DROP INDEX public.messaging_message_3cfbd988;
DROP INDEX public.messaging_message_0a7be3b3;
DROP INDEX public.django_session_session_key_2e62ee7421ad42b5_like;
DROP INDEX public.django_session_de54fa62;
DROP INDEX public.django_cron_cronjoblog_code_754ef82e28dbbaf4_idx;
DROP INDEX public.django_cron_cronjoblog_code_633b08e9abde5764_idx;
DROP INDEX public.django_cron_cronjoblog_code_4e16f5a60e31a319_idx;
DROP INDEX public.django_cron_cronjoblog_code_2f057d1bb457cb7a_like;
DROP INDEX public.django_cron_cronjoblog_c4d98dbd;
DROP INDEX public.django_cron_cronjoblog_c1336794;
DROP INDEX public.django_cron_cronjoblog_a05e4b70;
DROP INDEX public.django_cron_cronjoblog_305d2889;
DROP INDEX public.django_admin_log_e8701ad4;
DROP INDEX public.django_admin_log_417f1b1c;
DROP INDEX public.cms_usersettings_2655b062;
DROP INDEX public.cms_title_slug_5affc35728a8631_like;
DROP INDEX public.cms_title_path_340447daeb3069bd_like;
DROP INDEX public.cms_title_language_485fe28eccda6924_like;
DROP INDEX public.cms_title_f7202fc0;
DROP INDEX public.cms_title_d6fe1d0b;
DROP INDEX public.cms_title_b7700099;
DROP INDEX public.cms_title_8512ae7d;
DROP INDEX public.cms_title_2dbcba41;
DROP INDEX public.cms_title_1a63c800;
DROP INDEX public.cms_title_1268de9a;
DROP INDEX public.cms_staticplaceholder_9365d6e7;
DROP INDEX public.cms_staticplaceholder_5cb48773;
DROP INDEX public.cms_staticplaceholder_1ee2744d;
DROP INDEX public.cms_placeholderreference_328d0afc;
DROP INDEX public.cms_placeholder_slot_5bd367f0f4cc7d75_like;
DROP INDEX public.cms_placeholder_5e97994e;
DROP INDEX public.cms_pageusergroup_e93cb7eb;
DROP INDEX public.cms_pageuser_e93cb7eb;
DROP INDEX public.cms_pagepermission_e8701ad4;
DROP INDEX public.cms_pagepermission_1a63c800;
DROP INDEX public.cms_pagepermission_0e939a4f;
DROP INDEX public.cms_page_reverse_id_5b199d3a21c59064_like;
DROP INDEX public.cms_page_placeholders_667a6151;
DROP INDEX public.cms_page_placeholders_1a63c800;
DROP INDEX public.cms_page_path_518270318703c18f_like;
DROP INDEX public.cms_page_navigation_extenders_273e8b3b3d661759_like;
DROP INDEX public.cms_page_e721871e;
DROP INDEX public.cms_page_db3eb53f;
DROP INDEX public.cms_page_cb540373;
DROP INDEX public.cms_page_b7700099;
DROP INDEX public.cms_page_application_urls_55ae69847a069593_like;
DROP INDEX public.cms_page_93b83098;
DROP INDEX public.cms_page_9365d6e7;
DROP INDEX public.cms_page_7b8acfa6;
DROP INDEX public.cms_page_6be37982;
DROP INDEX public.cms_page_4fa1c803;
DROP INDEX public.cms_page_3d9ef52f;
DROP INDEX public.cms_page_2247c5f0;
DROP INDEX public.cms_page_1d85575d;
DROP INDEX public.cms_globalpagepermission_sites_a3d12ecd;
DROP INDEX public.cms_globalpagepermission_sites_9365d6e7;
DROP INDEX public.cms_globalpagepermission_e8701ad4;
DROP INDEX public.cms_globalpagepermission_0e939a4f;
DROP INDEX public.cms_cmsplugin_plugin_type_13246ba49a202411_like;
DROP INDEX public.cms_cmsplugin_path_7692c19a7d5df9d5_like;
DROP INDEX public.cms_cmsplugin_language_25e8267b6b921b3c_like;
DROP INDEX public.cms_cmsplugin_b5e4cf8f;
DROP INDEX public.cms_cmsplugin_8512ae7d;
DROP INDEX public.cms_cmsplugin_6be37982;
DROP INDEX public.cms_cmsplugin_667a6151;
DROP INDEX public.cms_aliaspluginmodel_b25eaab4;
DROP INDEX public.cms_aliaspluginmodel_921abf5c;
DROP INDEX public.auth_user_username_fa32edb053bbc09_like;
DROP INDEX public.auth_user_user_permissions_e8701ad4;
DROP INDEX public.auth_user_user_permissions_8373b171;
DROP INDEX public.auth_user_groups_e8701ad4;
DROP INDEX public.auth_user_groups_0e939a4f;
DROP INDEX public.auth_permission_417f1b1c;
DROP INDEX public.auth_group_permissions_8373b171;
DROP INDEX public.auth_group_permissions_0e939a4f;
DROP INDEX public.auth_group_name_6bde41131930bbea_like;
ALTER TABLE ONLY public.vle_groupmember DROP CONSTRAINT vle_groupmember_user_id_37b24c55d3ef8b6c_uniq;
ALTER TABLE ONLY public.vle_groupmember DROP CONSTRAINT vle_groupmember_pkey;
ALTER TABLE ONLY public.vle_groupkvstore DROP CONSTRAINT vle_groupkvstore_vle_course_id_52c196056a86cf6_uniq;
ALTER TABLE ONLY public.vle_groupkvstore DROP CONSTRAINT vle_groupkvstore_pkey;
ALTER TABLE ONLY public.vle_coursemember DROP CONSTRAINT vle_coursemember_user_id_3b75f7cabc2bcee7_uniq;
ALTER TABLE ONLY public.vle_coursemember DROP CONSTRAINT vle_coursemember_pkey;
ALTER TABLE ONLY public.vle_coursekvstore DROP CONSTRAINT vle_coursekvstore_vle_course_id_key;
ALTER TABLE ONLY public.vle_coursekvstore DROP CONSTRAINT vle_coursekvstore_pkey;
ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT reversion_version_pkey;
ALTER TABLE ONLY public.reversion_revision DROP CONSTRAINT reversion_revision_pkey;
ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_pkey;
ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key;
ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_pkey;
ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_pkey;
ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_client_id_key;
ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_pkey;
ALTER TABLE ONLY public.messaging_messagetargetuser DROP CONSTRAINT messaging_messagetargetuser_pkey;
ALTER TABLE ONLY public.messaging_messagetargetuser DROP CONSTRAINT messaging_messagetargetuser_message_id_79ddf788a925974c_uniq;
ALTER TABLE ONLY public.messaging_messagetargetgroup DROP CONSTRAINT messaging_messagetargetgroup_pkey;
ALTER TABLE ONLY public.messaging_messagetargetgroup DROP CONSTRAINT messaging_messagetargetgroup_message_id_2cb9a3bf986841d_uniq;
ALTER TABLE ONLY public.messaging_messagetargetcourse DROP CONSTRAINT messaging_messagetargetcourse_pkey;
ALTER TABLE ONLY public.messaging_messagetargetcourse DROP CONSTRAINT messaging_messagetargetcourse_message_id_76ad297b9a8d693e_uniq;
ALTER TABLE ONLY public.messaging_messageitem DROP CONSTRAINT messaging_messageitem_pkey;
ALTER TABLE ONLY public.messaging_messageitem DROP CONSTRAINT messaging_messageitem_message_id_1645f99e78b6bb19_uniq;
ALTER TABLE ONLY public.messaging_messageattachment DROP CONSTRAINT messaging_messageattachment_pkey;
ALTER TABLE ONLY public.messaging_message DROP CONSTRAINT messaging_message_pkey;
ALTER TABLE ONLY public.menus_cachekey DROP CONSTRAINT menus_cachekey_pkey;
ALTER TABLE ONLY public.into_oauth_oauthsignout DROP CONSTRAINT into_oauth_oauthsignout_pkey;
ALTER TABLE ONLY public.into_oauth_oauthsignout DROP CONSTRAINT into_oauth_oauthsignout_application_id_key;
ALTER TABLE ONLY public.djangocms_text_ckeditor_text DROP CONSTRAINT djangocms_text_ckeditor_text_pkey;
ALTER TABLE ONLY public.djangocms_style_style DROP CONSTRAINT djangocms_style_style_pkey;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_cron_cronjoblog DROP CONSTRAINT django_cron_cronjoblog_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_2086d8a5bb1afc06_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.cms_usersettings DROP CONSTRAINT cms_usersettings_user_id_key;
ALTER TABLE ONLY public.cms_usersettings DROP CONSTRAINT cms_usersettings_pkey;
ALTER TABLE ONLY public.cms_urlconfrevision DROP CONSTRAINT cms_urlconfrevision_pkey;
ALTER TABLE ONLY public.cms_title DROP CONSTRAINT cms_title_publisher_public_id_key;
ALTER TABLE ONLY public.cms_title DROP CONSTRAINT cms_title_pkey;
ALTER TABLE ONLY public.cms_title DROP CONSTRAINT cms_title_language_7a69dc7eaf856287_uniq;
ALTER TABLE ONLY public.cms_staticplaceholder DROP CONSTRAINT cms_staticplaceholder_pkey;
ALTER TABLE ONLY public.cms_staticplaceholder DROP CONSTRAINT cms_staticplaceholder_code_6c6b490a9fe0e459_uniq;
ALTER TABLE ONLY public.cms_placeholderreference DROP CONSTRAINT cms_placeholderreference_pkey;
ALTER TABLE ONLY public.cms_placeholder DROP CONSTRAINT cms_placeholder_pkey;
ALTER TABLE ONLY public.cms_pageusergroup DROP CONSTRAINT cms_pageusergroup_pkey;
ALTER TABLE ONLY public.cms_pageuser DROP CONSTRAINT cms_pageuser_pkey;
ALTER TABLE ONLY public.cms_pagepermission DROP CONSTRAINT cms_pagepermission_pkey;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_reverse_id_a864144bd3516c9_uniq;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_publisher_public_id_key;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_publisher_is_draft_7597e61e0082d3aa_uniq;
ALTER TABLE ONLY public.cms_page_placeholders DROP CONSTRAINT cms_page_placeholders_pkey;
ALTER TABLE ONLY public.cms_page_placeholders DROP CONSTRAINT cms_page_placeholders_page_id_placeholder_id_key;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_pkey;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_path_518270318703c18f_uniq;
ALTER TABLE ONLY public.cms_globalpagepermission_sites DROP CONSTRAINT cms_globalpagepermission_sites_pkey;
ALTER TABLE ONLY public.cms_globalpagepermission_sites DROP CONSTRAINT cms_globalpagepermission_site_globalpagepermission_id_site__key;
ALTER TABLE ONLY public.cms_globalpagepermission DROP CONSTRAINT cms_globalpagepermission_pkey;
ALTER TABLE ONLY public.cms_cmsplugin DROP CONSTRAINT cms_cmsplugin_pkey;
ALTER TABLE ONLY public.cms_cmsplugin DROP CONSTRAINT cms_cmsplugin_path_7692c19a7d5df9d5_uniq;
ALTER TABLE ONLY public.cms_aliaspluginmodel DROP CONSTRAINT cms_aliaspluginmodel_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_key;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.vle_groupmember ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.vle_groupkvstore ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.vle_coursemember ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.vle_coursekvstore ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reversion_version ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reversion_revision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oauth2_provider_refreshtoken ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oauth2_provider_grant ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oauth2_provider_application ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oauth2_provider_accesstoken ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messaging_messagetargetuser ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messaging_messagetargetgroup ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messaging_messagetargetcourse ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messaging_messageitem ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messaging_messageattachment ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messaging_message ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.menus_cachekey ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.into_oauth_oauthsignout ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_cron_cronjoblog ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_usersettings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_urlconfrevision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_title ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_staticplaceholder ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_placeholder ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_pagepermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_page_placeholders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_page ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_globalpagepermission_sites ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_globalpagepermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cms_cmsplugin ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.vle_groupmember_id_seq;
DROP TABLE public.vle_groupmember;
DROP SEQUENCE public.vle_groupkvstore_id_seq;
DROP TABLE public.vle_groupkvstore;
DROP SEQUENCE public.vle_coursemember_id_seq;
DROP TABLE public.vle_coursemember;
DROP SEQUENCE public.vle_coursekvstore_id_seq;
DROP TABLE public.vle_coursekvstore;
DROP SEQUENCE public.reversion_version_id_seq;
DROP TABLE public.reversion_version;
DROP SEQUENCE public.reversion_revision_id_seq;
DROP TABLE public.reversion_revision;
DROP SEQUENCE public.oauth2_provider_refreshtoken_id_seq;
DROP TABLE public.oauth2_provider_refreshtoken;
DROP SEQUENCE public.oauth2_provider_grant_id_seq;
DROP TABLE public.oauth2_provider_grant;
DROP SEQUENCE public.oauth2_provider_application_id_seq;
DROP TABLE public.oauth2_provider_application;
DROP SEQUENCE public.oauth2_provider_accesstoken_id_seq;
DROP TABLE public.oauth2_provider_accesstoken;
DROP SEQUENCE public.messaging_messagetargetuser_id_seq;
DROP TABLE public.messaging_messagetargetuser;
DROP SEQUENCE public.messaging_messagetargetgroup_id_seq;
DROP TABLE public.messaging_messagetargetgroup;
DROP SEQUENCE public.messaging_messagetargetcourse_id_seq;
DROP TABLE public.messaging_messagetargetcourse;
DROP SEQUENCE public.messaging_messageitem_id_seq;
DROP TABLE public.messaging_messageitem;
DROP SEQUENCE public.messaging_messageattachment_id_seq;
DROP TABLE public.messaging_messageattachment;
DROP SEQUENCE public.messaging_message_id_seq;
DROP TABLE public.messaging_message;
DROP SEQUENCE public.menus_cachekey_id_seq;
DROP TABLE public.menus_cachekey;
DROP SEQUENCE public.into_oauth_oauthsignout_id_seq;
DROP TABLE public.into_oauth_oauthsignout;
DROP TABLE public.djangocms_text_ckeditor_text;
DROP TABLE public.djangocms_style_style;
DROP SEQUENCE public.django_site_id_seq;
DROP TABLE public.django_site;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_cron_cronjoblog_id_seq;
DROP TABLE public.django_cron_cronjoblog;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.cms_usersettings_id_seq;
DROP TABLE public.cms_usersettings;
DROP SEQUENCE public.cms_urlconfrevision_id_seq;
DROP TABLE public.cms_urlconfrevision;
DROP SEQUENCE public.cms_title_id_seq;
DROP TABLE public.cms_title;
DROP SEQUENCE public.cms_staticplaceholder_id_seq;
DROP TABLE public.cms_staticplaceholder;
DROP TABLE public.cms_placeholderreference;
DROP SEQUENCE public.cms_placeholder_id_seq;
DROP TABLE public.cms_placeholder;
DROP TABLE public.cms_pageusergroup;
DROP TABLE public.cms_pageuser;
DROP SEQUENCE public.cms_pagepermission_id_seq;
DROP TABLE public.cms_pagepermission;
DROP SEQUENCE public.cms_page_placeholders_id_seq;
DROP TABLE public.cms_page_placeholders;
DROP SEQUENCE public.cms_page_id_seq;
DROP TABLE public.cms_page;
DROP SEQUENCE public.cms_globalpagepermission_sites_id_seq;
DROP TABLE public.cms_globalpagepermission_sites;
DROP SEQUENCE public.cms_globalpagepermission_id_seq;
DROP TABLE public.cms_globalpagepermission;
DROP SEQUENCE public.cms_cmsplugin_id_seq;
DROP TABLE public.cms_cmsplugin;
DROP TABLE public.cms_aliaspluginmodel;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_aliaspluginmodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_aliaspluginmodel (
    cmsplugin_ptr_id integer NOT NULL,
    plugin_id integer,
    alias_placeholder_id integer
);


ALTER TABLE public.cms_aliaspluginmodel OWNER TO postgres;

--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    "position" smallint NOT NULL,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    parent_id integer,
    placeholder_id integer,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    path character varying(255) NOT NULL,
    CONSTRAINT cms_cmsplugin_depth_check CHECK ((depth >= 0)),
    CONSTRAINT cms_cmsplugin_numchild_check CHECK ((numchild >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO postgres;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO postgres;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL,
    group_id integer,
    user_id integer
);


ALTER TABLE public.cms_globalpagepermission OWNER TO postgres;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO postgres;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO postgres;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO postgres;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(255) NOT NULL,
    changed_by character varying(255) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    template character varying(100) NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    is_home boolean NOT NULL,
    application_urls character varying(200),
    application_namespace character varying(200),
    publisher_is_draft boolean NOT NULL,
    languages character varying(255),
    revision_id integer NOT NULL,
    xframe_options integer NOT NULL,
    parent_id integer,
    publisher_public_id integer,
    site_id integer NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    path character varying(255) NOT NULL,
    CONSTRAINT cms_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT cms_page_numchild_check CHECK ((numchild >= 0)),
    CONSTRAINT cms_page_revision_id_check CHECK ((revision_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO postgres;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO postgres;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO postgres;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO postgres;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    group_id integer,
    page_id integer,
    user_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO postgres;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO postgres;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO postgres;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO postgres;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(255) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO postgres;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO postgres;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_placeholderreference; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_placeholderreference (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(255) NOT NULL,
    placeholder_ref_id integer
);


ALTER TABLE public.cms_placeholderreference OWNER TO postgres;

--
-- Name: cms_staticplaceholder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_staticplaceholder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    dirty boolean NOT NULL,
    creation_method character varying(20) NOT NULL,
    draft_id integer,
    public_id integer,
    site_id integer
);


ALTER TABLE public.cms_staticplaceholder OWNER TO postgres;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_staticplaceholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_staticplaceholder_id_seq OWNER TO postgres;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_staticplaceholder_id_seq OWNED BY cms_staticplaceholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    page_title character varying(255),
    menu_title character varying(255),
    meta_description text,
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    redirect character varying(2048),
    creation_date timestamp with time zone NOT NULL,
    published boolean NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_state smallint NOT NULL,
    page_id integer NOT NULL,
    publisher_public_id integer
);


ALTER TABLE public.cms_title OWNER TO postgres;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO postgres;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cms_urlconfrevision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_urlconfrevision (
    id integer NOT NULL,
    revision character varying(255) NOT NULL
);


ALTER TABLE public.cms_urlconfrevision OWNER TO postgres;

--
-- Name: cms_urlconfrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_urlconfrevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_urlconfrevision_id_seq OWNER TO postgres;

--
-- Name: cms_urlconfrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_urlconfrevision_id_seq OWNED BY cms_urlconfrevision.id;


--
-- Name: cms_usersettings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_usersettings (
    id integer NOT NULL,
    language character varying(10) NOT NULL,
    clipboard_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.cms_usersettings OWNER TO postgres;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_usersettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_usersettings_id_seq OWNER TO postgres;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_usersettings_id_seq OWNED BY cms_usersettings.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_cron_cronjoblog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_cron_cronjoblog (
    id integer NOT NULL,
    code character varying(64) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    is_success boolean NOT NULL,
    message text NOT NULL,
    ran_at_time time without time zone
);


ALTER TABLE public.django_cron_cronjoblog OWNER TO postgres;

--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_cron_cronjoblog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_cron_cronjoblog_id_seq OWNER TO postgres;

--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_cron_cronjoblog_id_seq OWNED BY django_cron_cronjoblog.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djangocms_style_style; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE djangocms_style_style (
    cmsplugin_ptr_id integer NOT NULL,
    class_name character varying(50),
    tag_type character varying(50) NOT NULL,
    padding_left smallint,
    padding_right smallint,
    padding_top smallint,
    padding_bottom smallint,
    margin_left smallint,
    margin_right smallint,
    margin_top smallint,
    margin_bottom smallint,
    additional_classes character varying(200) NOT NULL
);


ALTER TABLE public.djangocms_style_style OWNER TO postgres;

--
-- Name: djangocms_text_ckeditor_text; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE djangocms_text_ckeditor_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.djangocms_text_ckeditor_text OWNER TO postgres;

--
-- Name: into_oauth_oauthsignout; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE into_oauth_oauthsignout (
    id integer NOT NULL,
    signout_uri character varying(200) NOT NULL,
    application_id integer NOT NULL
);


ALTER TABLE public.into_oauth_oauthsignout OWNER TO postgres;

--
-- Name: into_oauth_oauthsignout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE into_oauth_oauthsignout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.into_oauth_oauthsignout_id_seq OWNER TO postgres;

--
-- Name: into_oauth_oauthsignout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE into_oauth_oauthsignout_id_seq OWNED BY into_oauth_oauthsignout.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO postgres;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO postgres;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: messaging_message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messaging_message (
    id integer NOT NULL,
    is_notification boolean NOT NULL,
    url character varying(200) NOT NULL,
    subject character varying(200) NOT NULL,
    body text NOT NULL,
    sent timestamp with time zone NOT NULL,
    target_all boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    user_id integer,
    CONSTRAINT messaging_message_level_check CHECK ((level >= 0)),
    CONSTRAINT messaging_message_lft_check CHECK ((lft >= 0)),
    CONSTRAINT messaging_message_rght_check CHECK ((rght >= 0)),
    CONSTRAINT messaging_message_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.messaging_message OWNER TO postgres;

--
-- Name: messaging_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messaging_message_id_seq OWNER TO postgres;

--
-- Name: messaging_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_message_id_seq OWNED BY messaging_message.id;


--
-- Name: messaging_messageattachment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messaging_messageattachment (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    message_id integer NOT NULL
);


ALTER TABLE public.messaging_messageattachment OWNER TO postgres;

--
-- Name: messaging_messageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_messageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messaging_messageattachment_id_seq OWNER TO postgres;

--
-- Name: messaging_messageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_messageattachment_id_seq OWNED BY messaging_messageattachment.id;


--
-- Name: messaging_messageitem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messaging_messageitem (
    id integer NOT NULL,
    source boolean NOT NULL,
    read timestamp with time zone,
    deleted timestamp with time zone,
    message_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.messaging_messageitem OWNER TO postgres;

--
-- Name: messaging_messageitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_messageitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messaging_messageitem_id_seq OWNER TO postgres;

--
-- Name: messaging_messageitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_messageitem_id_seq OWNED BY messaging_messageitem.id;


--
-- Name: messaging_messagetargetcourse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messaging_messagetargetcourse (
    id integer NOT NULL,
    vle_course_id character varying(100) NOT NULL,
    message_id integer NOT NULL
);


ALTER TABLE public.messaging_messagetargetcourse OWNER TO postgres;

--
-- Name: messaging_messagetargetcourse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_messagetargetcourse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messaging_messagetargetcourse_id_seq OWNER TO postgres;

--
-- Name: messaging_messagetargetcourse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_messagetargetcourse_id_seq OWNED BY messaging_messagetargetcourse.id;


--
-- Name: messaging_messagetargetgroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messaging_messagetargetgroup (
    id integer NOT NULL,
    vle_course_id character varying(100) NOT NULL,
    vle_group_id character varying(100) NOT NULL,
    message_id integer NOT NULL
);


ALTER TABLE public.messaging_messagetargetgroup OWNER TO postgres;

--
-- Name: messaging_messagetargetgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_messagetargetgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messaging_messagetargetgroup_id_seq OWNER TO postgres;

--
-- Name: messaging_messagetargetgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_messagetargetgroup_id_seq OWNED BY messaging_messagetargetgroup.id;


--
-- Name: messaging_messagetargetuser; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messaging_messagetargetuser (
    id integer NOT NULL,
    message_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.messaging_messagetargetuser OWNER TO postgres;

--
-- Name: messaging_messagetargetuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_messagetargetuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messaging_messagetargetuser_id_seq OWNER TO postgres;

--
-- Name: messaging_messagetargetuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_messagetargetuser_id_seq OWNED BY messaging_messagetargetuser.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth2_provider_accesstoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_provider_accesstoken_id_seq OWNED BY oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth2_provider_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    skip_authorization boolean NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_provider_application_id_seq OWNED BY oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth2_provider_grant (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_provider_grant_id_seq OWNED BY oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth2_provider_refreshtoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id integer NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_provider_refreshtoken_id_seq OWNED BY oauth2_provider_refreshtoken.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(191) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment text NOT NULL,
    user_id integer
);


ALTER TABLE public.reversion_revision OWNER TO postgres;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO postgres;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    content_type_id integer NOT NULL,
    revision_id integer NOT NULL
);


ALTER TABLE public.reversion_version OWNER TO postgres;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO postgres;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: vle_coursekvstore; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vle_coursekvstore (
    id integer NOT NULL,
    vle_course_id character varying(100) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.vle_coursekvstore OWNER TO postgres;

--
-- Name: vle_coursekvstore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vle_coursekvstore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vle_coursekvstore_id_seq OWNER TO postgres;

--
-- Name: vle_coursekvstore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vle_coursekvstore_id_seq OWNED BY vle_coursekvstore.id;


--
-- Name: vle_coursemember; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vle_coursemember (
    id integer NOT NULL,
    vle_course_id character varying(100) NOT NULL,
    is_tutor boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.vle_coursemember OWNER TO postgres;

--
-- Name: vle_coursemember_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vle_coursemember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vle_coursemember_id_seq OWNER TO postgres;

--
-- Name: vle_coursemember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vle_coursemember_id_seq OWNED BY vle_coursemember.id;


--
-- Name: vle_groupkvstore; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vle_groupkvstore (
    id integer NOT NULL,
    vle_course_id character varying(100) NOT NULL,
    vle_group_id character varying(100) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.vle_groupkvstore OWNER TO postgres;

--
-- Name: vle_groupkvstore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vle_groupkvstore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vle_groupkvstore_id_seq OWNER TO postgres;

--
-- Name: vle_groupkvstore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vle_groupkvstore_id_seq OWNED BY vle_groupkvstore.id;


--
-- Name: vle_groupmember; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vle_groupmember (
    id integer NOT NULL,
    vle_course_id character varying(100) NOT NULL,
    vle_group_id character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.vle_groupmember OWNER TO postgres;

--
-- Name: vle_groupmember_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vle_groupmember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vle_groupmember_id_seq OWNER TO postgres;

--
-- Name: vle_groupmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vle_groupmember_id_seq OWNED BY vle_groupmember.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_staticplaceholder ALTER COLUMN id SET DEFAULT nextval('cms_staticplaceholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_urlconfrevision ALTER COLUMN id SET DEFAULT nextval('cms_urlconfrevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_usersettings ALTER COLUMN id SET DEFAULT nextval('cms_usersettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_cron_cronjoblog ALTER COLUMN id SET DEFAULT nextval('django_cron_cronjoblog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY into_oauth_oauthsignout ALTER COLUMN id SET DEFAULT nextval('into_oauth_oauthsignout_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message ALTER COLUMN id SET DEFAULT nextval('messaging_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messageattachment ALTER COLUMN id SET DEFAULT nextval('messaging_messageattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messageitem ALTER COLUMN id SET DEFAULT nextval('messaging_messageitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetcourse ALTER COLUMN id SET DEFAULT nextval('messaging_messagetargetcourse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetgroup ALTER COLUMN id SET DEFAULT nextval('messaging_messagetargetgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetuser ALTER COLUMN id SET DEFAULT nextval('messaging_messagetargetuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_application_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_grant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vle_coursekvstore ALTER COLUMN id SET DEFAULT nextval('vle_coursekvstore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vle_coursemember ALTER COLUMN id SET DEFAULT nextval('vle_coursemember_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vle_groupkvstore ALTER COLUMN id SET DEFAULT nextval('vle_groupkvstore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vle_groupmember ALTER COLUMN id SET DEFAULT nextval('vle_groupmember_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add application	7	add_application
20	Can change application	7	change_application
21	Can delete application	7	delete_application
22	Can add grant	8	add_grant
23	Can change grant	8	change_grant
24	Can delete grant	8	delete_grant
25	Can add access token	9	add_accesstoken
26	Can change access token	9	change_accesstoken
27	Can delete access token	9	delete_accesstoken
28	Can add refresh token	10	add_refreshtoken
29	Can change refresh token	10	change_refreshtoken
30	Can delete refresh token	10	delete_refreshtoken
31	Can add oauth sign out	11	add_oauthsignout
32	Can change oauth sign out	11	change_oauthsignout
33	Can delete oauth sign out	11	delete_oauthsignout
34	Can use Structure mode	12	use_structure
35	Can change page	13	change_page
36	Can add text	14	add_text
37	Can change text	14	change_text
38	Can delete text	14	delete_text
39	Can add site	15	add_site
40	Can change site	15	change_site
41	Can delete site	15	delete_site
42	Can add user setting	16	add_usersettings
43	Can change user setting	16	change_usersettings
44	Can delete user setting	16	delete_usersettings
45	Can add page	13	add_page
46	Can delete page	13	delete_page
47	Can view page	13	view_page
48	Can publish page	13	publish_page
49	Can edit static placeholders	13	edit_static_placeholder
50	Can add Page global permission	17	add_globalpagepermission
51	Can change Page global permission	17	change_globalpagepermission
52	Can delete Page global permission	17	delete_globalpagepermission
53	Can add Page permission	18	add_pagepermission
54	Can change Page permission	18	change_pagepermission
55	Can delete Page permission	18	delete_pagepermission
56	Can add User (page)	19	add_pageuser
57	Can change User (page)	19	change_pageuser
58	Can delete User (page)	19	delete_pageuser
59	Can add User group (page)	20	add_pageusergroup
60	Can change User group (page)	20	change_pageusergroup
61	Can delete User group (page)	20	delete_pageusergroup
62	Can add placeholder	12	add_placeholder
63	Can change placeholder	12	change_placeholder
64	Can delete placeholder	12	delete_placeholder
65	Can add cms plugin	21	add_cmsplugin
66	Can change cms plugin	21	change_cmsplugin
67	Can delete cms plugin	21	delete_cmsplugin
68	Can add title	22	add_title
69	Can change title	22	change_title
70	Can delete title	22	delete_title
71	Can add placeholder reference	23	add_placeholderreference
72	Can change placeholder reference	23	change_placeholderreference
73	Can delete placeholder reference	23	delete_placeholderreference
74	Can add static placeholder	24	add_staticplaceholder
75	Can change static placeholder	24	change_staticplaceholder
76	Can delete static placeholder	24	delete_staticplaceholder
77	Can add alias plugin model	25	add_aliaspluginmodel
78	Can change alias plugin model	25	change_aliaspluginmodel
79	Can delete alias plugin model	25	delete_aliaspluginmodel
80	Can add urlconf revision	26	add_urlconfrevision
81	Can change urlconf revision	26	change_urlconfrevision
82	Can delete urlconf revision	26	delete_urlconfrevision
83	Can add cache key	27	add_cachekey
84	Can change cache key	27	change_cachekey
85	Can delete cache key	27	delete_cachekey
86	Can add style	28	add_style
87	Can change style	28	change_style
88	Can delete style	28	delete_style
89	Can add revision	29	add_revision
90	Can change revision	29	change_revision
91	Can delete revision	29	delete_revision
92	Can add version	30	add_version
93	Can change version	30	change_version
94	Can delete version	30	delete_version
95	Can add cron job log	31	add_cronjoblog
96	Can change cron job log	31	change_cronjoblog
97	Can delete cron job log	31	delete_cronjoblog
98	Can add course member	32	add_coursemember
99	Can change course member	32	change_coursemember
100	Can delete course member	32	delete_coursemember
101	Can add group member	33	add_groupmember
102	Can change group member	33	change_groupmember
103	Can delete group member	33	delete_groupmember
104	Can add course kv store	34	add_coursekvstore
105	Can change course kv store	34	change_coursekvstore
106	Can delete course kv store	34	delete_coursekvstore
107	Can add group kv store	35	add_groupkvstore
108	Can change group kv store	35	change_groupkvstore
109	Can delete group kv store	35	delete_groupkvstore
110	Can add message	36	add_message
111	Can change message	36	change_message
112	Can delete message	36	delete_message
113	Can add message attachment	37	add_messageattachment
114	Can change message attachment	37	change_messageattachment
115	Can delete message attachment	37	delete_messageattachment
116	Can add message item	38	add_messageitem
117	Can change message item	38	change_messageitem
118	Can delete message item	38	delete_messageitem
119	Can add message target user	39	add_messagetargetuser
120	Can change message target user	39	change_messagetargetuser
121	Can delete message target user	39	delete_messagetargetuser
122	Can add message target course	40	add_messagetargetcourse
123	Can change message target course	40	change_messagetargetcourse
124	Can delete message target course	40	delete_messagetargetcourse
125	Can add message target group	41	add_messagetargetgroup
126	Can change message target group	41	change_messagetargetgroup
127	Can delete message target group	41	delete_messagetargetgroup
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 127, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$20000$4k4q54pCZ5J9$Cp/pN0Kc7xQMwNj3P51L76aXN4D9RHcoie5iBWzhAbw=	2016-08-18 14:52:52.774289+00	f	tyrion.lannister	Tyrion	Lannister	tyrion.lannister@intoglobal.com	f	t	2016-02-14 07:22:04+00
1	pbkdf2_sha256$20000$LMrbVKg5ARBQ$4pQi1YiYA4eagf6NPX1nhLhcNBWFFJIF3/nb/RSLAyc=	2016-08-30 14:33:15.869234+00	t	admin			admin@intoglobal.com	t	t	2016-02-14 07:04:18+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_aliaspluginmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_aliaspluginmodel (cmsplugin_ptr_id, plugin_id, alias_placeholder_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_cmsplugin (id, "position", language, plugin_type, creation_date, changed_date, parent_id, placeholder_id, depth, numchild, path) FROM stdin;
1	0	en	TextPlugin	2016-08-30 14:26:57.295843+00	2016-08-30 14:27:05.099171+00	\N	2	1	0	0001
3	1	en	NotificationsPlugin	2016-08-30 14:33:33.083129+00	2016-08-30 14:33:33.093475+00	\N	2	1	0	0003
5	1	en	NotificationsPlugin	2016-08-30 14:33:33.083129+00	2016-08-30 14:33:37.065628+00	\N	3	1	0	0005
4	0	en	TextPlugin	2016-08-30 14:26:57.295843+00	2016-08-30 14:33:37.073469+00	\N	3	1	0	0004
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 5, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_globalpagepermission (id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page, group_id, user_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_page (id, created_by, changed_by, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, template, login_required, limit_visibility_in_menu, is_home, application_urls, application_namespace, publisher_is_draft, languages, revision_id, xframe_options, parent_id, publisher_public_id, site_id, depth, numchild, path) FROM stdin;
4	admin	admin	2016-08-30 14:27:35.278598+00	2016-08-30 14:27:35.406293+00	2016-08-30 14:27:35.262735+00	\N	t	f	\N		INHERIT	f	\N	f	MessagingApp	\N	f	en	0	0	\N	3	1	1	0	0004
3	admin	admin	2016-08-30 14:27:21.663725+00	2016-08-30 14:27:35.556379+00	2016-08-30 14:27:35.262735+00	\N	t	f	\N		INHERIT	f	\N	f	MessagingApp	\N	t	en	0	0	\N	4	1	1	0	0003
2	admin	admin	2016-08-30 14:26:47.941582+00	2016-08-30 14:33:37.125395+00	2016-08-30 14:26:47.934619+00	\N	t	f	\N	\N	INHERIT	f	\N	t	\N	\N	f	en	0	0	\N	1	1	1	0	0002
1	admin	admin	2016-08-30 14:26:47.866138+00	2016-08-30 14:33:37.292374+00	2016-08-30 14:26:47.934619+00	\N	t	f	\N	\N	INHERIT	f	\N	t	\N	\N	t	en	0	0	\N	2	1	1	0	0001
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_page_id_seq', 4, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	1	2
2	2	3
3	3	4
4	4	5
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 4, true);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pagepermission (id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, group_id, page_id, user_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
1	clipboard	\N
2	content	\N
3	content	\N
4	content	\N
5	content	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 5, true);


--
-- Data for Name: cms_placeholderreference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_placeholderreference (cmsplugin_ptr_id, name, placeholder_ref_id) FROM stdin;
\.


--
-- Data for Name: cms_staticplaceholder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_staticplaceholder (id, name, code, dirty, creation_method, draft_id, public_id, site_id) FROM stdin;
\.


--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_staticplaceholder_id_seq', 1, false);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_title (id, language, title, page_title, menu_title, meta_description, slug, path, has_url_overwrite, redirect, creation_date, published, publisher_is_draft, publisher_state, page_id, publisher_public_id) FROM stdin;
4	en	Messaging				messaging	messaging	f		2016-08-30 14:27:21.709497+00	t	f	0	4	3
3	en	Messaging				messaging	messaging	f		2016-08-30 14:27:21.709497+00	t	t	0	3	4
1	en	Home				home		f	\N	2016-08-30 14:26:47.902147+00	t	t	0	1	2
2	en	Home				home		f	\N	2016-08-30 14:26:47.902147+00	t	f	1	2	1
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_title_id_seq', 4, true);


--
-- Data for Name: cms_urlconfrevision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_urlconfrevision (id, revision) FROM stdin;
1	6c1860bf-fd99-4fd2-8d64-465b509bc98d
\.


--
-- Name: cms_urlconfrevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_urlconfrevision_id_seq', 1, false);


--
-- Data for Name: cms_usersettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_usersettings (id, language, clipboard_id, user_id) FROM stdin;
1	en	1	1
\.


--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_usersettings_id_seq', 1, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-02-14 07:22:05.009399+00	2	tyrion.lannister	1		4	1
2	2016-02-14 07:22:23.111323+00	2	tyrion.lannister	2	Changed first_name, last_name and email.	4	1
3	2016-02-14 07:25:01.921293+00	1	Moodle	1		7	1
4	2016-02-14 07:33:51.054597+00	1	Moodle	2	Changed redirect_uris.	7	1
5	2016-02-14 07:35:45.980832+00	1	Moodle	1		11	1
6	2016-02-14 07:38:52.582006+00	1	admin	2	Changed email.	4	1
7	2016-02-14 07:48:16.595567+00	1	Moodle	2	Changed signout_uri.	11	1
8	2016-02-14 07:48:31.517311+00	1	Moodle	2	Changed redirect_uris.	7	1
9	2016-08-30 14:26:48.115349+00	1	Home	1		13	1
10	2016-08-30 14:27:08.591478+00	1	Home	2		13	1
11	2016-08-30 14:27:21.807317+00	3	Messaging	1		13	1
12	2016-08-30 14:27:30.301495+00	3	Messaging	2	Changed application_urls and xframe_options.	13	1
13	2016-08-30 14:27:35.507976+00	3	Messaging	2		13	1
14	2016-08-30 14:28:09.240692+00	1	10.0.0.10:8000	2	Changed domain and name.	15	1
15	2016-08-30 14:33:37.200647+00	1	Home	2		13	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 15, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	oauth2_provider	application
8	oauth2_provider	grant
9	oauth2_provider	accesstoken
10	oauth2_provider	refreshtoken
11	into_oauth	oauthsignout
12	cms	placeholder
13	cms	page
14	djangocms_text_ckeditor	text
15	sites	site
16	cms	usersettings
17	cms	globalpagepermission
18	cms	pagepermission
19	cms	pageuser
20	cms	pageusergroup
21	cms	cmsplugin
22	cms	title
23	cms	placeholderreference
24	cms	staticplaceholder
25	cms	aliaspluginmodel
26	cms	urlconfrevision
27	menus	cachekey
28	djangocms_style	style
29	reversion	revision
30	reversion	version
31	django_cron	cronjoblog
32	vle	coursemember
33	vle	groupmember
34	vle	coursekvstore
35	vle	groupkvstore
36	messaging	message
37	messaging	messageattachment
38	messaging	messageitem
39	messaging	messagetargetuser
40	messaging	messagetargetcourse
41	messaging	messagetargetgroup
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 41, true);


--
-- Data for Name: django_cron_cronjoblog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_cron_cronjoblog (id, code, start_time, end_time, is_success, message, ran_at_time) FROM stdin;
1	vle.full_sync	2016-08-30 14:25:01.973246+00	2016-08-30 14:25:05.226786+00	t	Full VLE synchronization completed successfully	06:00:00
\.


--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_cron_cronjoblog_id_seq', 1, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-02-14 07:03:59.632916+00
2	auth	0001_initial	2016-02-14 07:04:00.161052+00
3	admin	0001_initial	2016-02-14 07:04:00.292431+00
4	contenttypes	0002_remove_content_type_name	2016-02-14 07:04:00.473046+00
5	auth	0002_alter_permission_name_max_length	2016-02-14 07:04:00.54101+00
6	auth	0003_alter_user_email_max_length	2016-02-14 07:04:00.613472+00
7	auth	0004_alter_user_username_opts	2016-02-14 07:04:00.684666+00
8	auth	0005_alter_user_last_login_null	2016-02-14 07:04:00.764359+00
9	auth	0006_require_contenttypes_0002	2016-02-14 07:04:00.780239+00
10	oauth2_provider	0001_initial	2016-02-14 07:04:01.299638+00
11	into_oauth	0001_initial	2016-02-14 07:04:01.428062+00
12	oauth2_provider	0002_08_updates	2016-02-14 07:04:02.015611+00
13	sessions	0001_initial	2016-02-14 07:04:02.096955+00
14	sites	0001_initial	2016-08-30 14:23:34.832868+00
15	cms	0001_initial	2016-08-30 14:23:35.186971+00
16	cms	0002_auto_20140816_1918	2016-08-30 14:23:36.23185+00
17	cms	0003_auto_20140926_2347	2016-08-30 14:23:36.289798+00
18	cms	0004_auto_20140924_1038	2016-08-30 14:23:36.752276+00
19	cms	0005_auto_20140924_1039	2016-08-30 14:23:36.767629+00
20	cms	0006_auto_20140924_1110	2016-08-30 14:23:37.539739+00
21	cms	0007_auto_20141028_1559	2016-08-30 14:23:37.603757+00
22	cms	0008_auto_20150208_2149	2016-08-30 14:23:37.661973+00
23	cms	0008_auto_20150121_0059	2016-08-30 14:23:37.762211+00
24	cms	0009_merge	2016-08-30 14:23:37.76501+00
25	cms	0010_migrate_use_structure	2016-08-30 14:23:37.849903+00
26	cms	0011_auto_20150419_1006	2016-08-30 14:23:37.956201+00
27	cms	0012_auto_20150607_2207	2016-08-30 14:23:38.125665+00
28	cms	0013_urlconfrevision	2016-08-30 14:23:38.136434+00
29	cms	0014_auto_20160404_1908	2016-08-30 14:23:38.148054+00
30	cms	0015_auto_20160421_0000	2016-08-30 14:23:38.206719+00
31	cms	0016_auto_20160608_1535	2016-08-30 14:23:38.362416+00
32	django_cron	0001_initial	2016-08-30 14:23:38.399869+00
33	django_cron	0002_remove_max_length_from_CronJobLog_message	2016-08-30 14:23:38.410711+00
34	djangocms_style	0001_initial	2016-08-30 14:23:38.48324+00
35	djangocms_style	0002_set_related_name_for_cmsplugin_ptr	2016-08-30 14:23:38.559742+00
36	djangocms_text_ckeditor	0001_initial	2016-08-30 14:23:38.633921+00
37	djangocms_text_ckeditor	0002_remove_related_name_for_cmsplugin_ptr	2016-08-30 14:23:38.891617+00
38	djangocms_text_ckeditor	0003_set_related_name_for_cmsplugin_ptr	2016-08-30 14:23:38.983581+00
39	djangocms_text_ckeditor	0004_auto_20160706_1339	2016-08-30 14:23:38.996037+00
40	menus	0001_initial	2016-08-30 14:23:39.013901+00
41	messaging	0001_initial	2016-08-30 14:23:40.056694+00
42	reversion	0001_initial	2016-08-30 14:23:40.281481+00
43	reversion	0002_auto_20141216_1509	2016-08-30 14:23:40.392592+00
44	vle	0001_initial	2016-08-30 14:23:41.379914+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 44, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
acwe7fe0u4c98yuoym7q76skte0reaet	MzQ4NTQ1MzU1ZWFjMDg1ZWYzZGViODEwZjY5OTg4YTE4OTk0MTk0NTp7ImNtc19hZG1pbl9zaXRlIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJjbXNfZWRpdCI6dHJ1ZSwiX2F1dGhfdXNlcl9oYXNoIjoiMzk4MDdmNGMwY2U3ZTQ3OWFhZTYzMDM1MGIzMTEzNjYyMzllODgwZSJ9	2016-09-13 14:28:16.218096+00
qlycyepwu99hlmgfiny55ndj7wqyy2h9	NGY4MjcyNDEyZDA1MWJmYzRhNTZkMWE5Y2JkZTdkYjBjZDA5NGFmYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNtc19lZGl0IjpmYWxzZSwiX2F1dGhfdXNlcl9oYXNoIjoiMzk4MDdmNGMwY2U3ZTQ3OWFhZTYzMDM1MGIzMTEzNjYyMzllODgwZSJ9	2016-09-13 14:33:37.556474+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	10.0.0.10:8000	10.0.0.10:8000
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djangocms_style_style; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY djangocms_style_style (cmsplugin_ptr_id, class_name, tag_type, padding_left, padding_right, padding_top, padding_bottom, margin_left, margin_right, margin_top, margin_bottom, additional_classes) FROM stdin;
\.


--
-- Data for Name: djangocms_text_ckeditor_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY djangocms_text_ckeditor_text (cmsplugin_ptr_id, body) FROM stdin;
1	<p>This is the Django CMS home page.</p>\n
4	<p>This is the Django CMS home page.</p>\n
\.


--
-- Data for Name: into_oauth_oauthsignout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY into_oauth_oauthsignout (id, signout_uri, application_id) FROM stdin;
1	http://10.0.0.10/auth/oauth/logout/	1
\.


--
-- Name: into_oauth_oauthsignout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('into_oauth_oauthsignout_id_seq', 1, true);


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 1, false);


--
-- Data for Name: messaging_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_message (id, is_notification, url, subject, body, sent, target_all, lft, rght, tree_id, level, parent_id, user_id) FROM stdin;
\.


--
-- Name: messaging_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_message_id_seq', 1, false);


--
-- Data for Name: messaging_messageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_messageattachment (id, file, message_id) FROM stdin;
\.


--
-- Name: messaging_messageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_messageattachment_id_seq', 1, false);


--
-- Data for Name: messaging_messageitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_messageitem (id, source, read, deleted, message_id, user_id) FROM stdin;
\.


--
-- Name: messaging_messageitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_messageitem_id_seq', 1, false);


--
-- Data for Name: messaging_messagetargetcourse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_messagetargetcourse (id, vle_course_id, message_id) FROM stdin;
\.


--
-- Name: messaging_messagetargetcourse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_messagetargetcourse_id_seq', 1, false);


--
-- Data for Name: messaging_messagetargetgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_messagetargetgroup (id, vle_course_id, vle_group_id, message_id) FROM stdin;
\.


--
-- Name: messaging_messagetargetgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_messagetargetgroup_id_seq', 1, false);


--
-- Data for Name: messaging_messagetargetuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_messagetargetuser (id, message_id, user_id) FROM stdin;
\.


--
-- Name: messaging_messagetargetuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_messagetargetuser_id_seq', 1, false);


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id) FROM stdin;
1	xOy6TGIkyFOO87VjNXCm4C77zM5pVK	2016-02-14 17:48:43.260772+00	write read	1	1
2	WeyzXUCICS13vjXSCjClXHjKlIXS9f	2016-02-14 17:49:09.016249+00	write read	1	2
3	oTK5seTm9ME0URUGWpeW0xzbkalLd2	2016-02-14 19:00:52.428173+00	write read	1	2
4	xElLBD5xR0K3NtGyHMxoXq380aSNM4	2016-08-19 00:52:53.336984+00	read write	1	2
\.


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_accesstoken_id_seq', 4, true);


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization) FROM stdin;
1	LrQTuK5NuLNDwTb9rHpOtkON1XdPPAI9a4CiWXmN	http://10.0.0.10/auth/oauth/login/	confidential	authorization-code	FSKDqyRIySpknKoqOceKyGFFU57T5DFLANSPZBT5Nbypr3Kfv1ZrfQEg5Xy35VbgLJ14eEBayoNMKqORPShF2x3x9EIo3aEwxKkwnB07KQUeDMBvXsR9IhI4eVbLo3mo	Moodle	1	f
\.


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_application_id_seq', 1, true);


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id) FROM stdin;
1	cO7nA0NYLXRlEgB2FBQnt94SvnpV6N	2016-02-14 07:47:53.379534+00	http://10.0.0.10/auth/oauth/login	write read	1	2
2	HVcjmZqVLIXGvxazCIcYqKSdjASEAO	2016-02-14 07:47:56.718712+00	http://10.0.0.10/auth/oauth/login	write read	1	2
3	30KWKkWBQE0c5b5CufdaUBAOBSuz6Z	2016-02-14 07:47:59.505771+00	http://10.0.0.10/auth/oauth/login	write read	1	2
4	LOrCIPzw4oDMzgu59x5IsaGeiKLIeE	2016-02-14 07:48:02.016682+00	http://10.0.0.10/auth/oauth/login	write read	1	2
5	Kw8HAuiE64pN2Khst0qASmyvyUFvKQ	2016-02-14 07:48:04.639092+00	http://10.0.0.10/auth/oauth/login	write read	1	2
6	ct4M9t6DR2aV3C8FvCV6jb7dYWFAu9	2016-02-14 07:48:07.052222+00	http://10.0.0.10/auth/oauth/login	write read	1	2
7	4D7M785uBiWnHSIbtMC4jc4pDpPGbz	2016-02-14 07:48:09.513796+00	http://10.0.0.10/auth/oauth/login	write read	1	2
\.


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_grant_id_seq', 11, true);


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id) FROM stdin;
1	zzsGOsKHk5OfTRU6tyhGGbtgCvKqWY	1	1	1
2	6b5CwnyjlfC5Bw614QTsp35rh4sHrl	2	1	2
3	DeAndawWEi1GfnClQUcVeJAbd4IY62	3	1	2
4	WmlvLmFVFxsRQUnpOm13YTlVQSPCzA	4	1	2
\.


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_refreshtoken_id_seq', 4, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reversion_revision (id, manager_slug, date_created, comment, user_id) FROM stdin;
1	default	2016-08-30 14:26:48.133327+00	Initial version.	1
2	default	2016-08-30 14:27:05.148036+00	Text plugin added to content	1
3	default	2016-08-30 14:27:08.621008+00	Publish	1
4	default	2016-08-30 14:27:21.82647+00	Initial version.	1
5	default	2016-08-30 14:27:30.437749+00	Changed application_urls and xframe_options.	1
6	default	2016-08-30 14:27:35.532236+00	Publish	1
7	default	2016-08-30 14:33:33.149274+00	Notifications Plugin plugin added to content	1
8	default	2016-08-30 14:33:37.236828+00	Publish	1
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 8, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reversion_version (id, object_id, object_id_int, format, serialized_data, object_repr, content_type_id, revision_id) FROM stdin;
1	1	1	json	[{"fields": {"navigation_extenders": null, "site": 1, "application_namespace": null, "path": "0001", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [2], "changed_date": "2016-08-30T14:26:48.071Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": true, "publication_date": "2016-08-30T14:26:47.934Z", "creation_date": "2016-08-30T14:26:47.866Z", "application_urls": null, "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 1}]	Home	13	1
2	2	2	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 2}]	content	12	1
3	1	1	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": null, "page": 1, "published": true, "path": "", "creation_date": "2016-08-30T14:26:47.902Z", "slug": "home"}, "model": "cms.title", "pk": 1}]	Home (home, en)	22	1
4	1	1	json	[{"fields": {"navigation_extenders": null, "site": 1, "application_namespace": null, "path": "0001", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [2], "changed_date": "2016-08-30T14:26:48.163Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": true, "publication_date": "2016-08-30T14:26:47.934Z", "creation_date": "2016-08-30T14:26:47.866Z", "application_urls": null, "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 1}]	Home	13	2
5	2	2	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 2}]	content	12	2
6	1	1	json	[{"fields": {"body": "<p>This is the Django CMS home page.</p>\\n"}, "model": "djangocms_text_ckeditor.text", "pk": 1}]	This is the...	14	2
7	1	1	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": null, "page": 1, "published": true, "path": "", "creation_date": "2016-08-30T14:26:47.902Z", "slug": "home"}, "model": "cms.title", "pk": 1}]	Home (home, en)	22	2
8	1	1	json	[{"fields": {"changed_date": "2016-08-30T14:27:05.099Z", "language": "en", "parent": null, "numchild": 0, "creation_date": "2016-08-30T14:26:57.295Z", "depth": 1, "position": 0, "path": "0001", "placeholder": 2, "plugin_type": "TextPlugin"}, "model": "cms.cmsplugin", "pk": 1}]	1	21	2
9	1	1	json	[{"fields": {"navigation_extenders": null, "site": 1, "application_namespace": null, "path": "0001", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [2], "changed_date": "2016-08-30T14:27:08.549Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": true, "publication_date": "2016-08-30T14:26:47.934Z", "creation_date": "2016-08-30T14:26:47.866Z", "application_urls": null, "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 1}]	Home	13	3
10	2	2	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 2}]	content	12	3
11	1	1	json	[{"fields": {"body": "<p>This is the Django CMS home page.</p>\\n"}, "model": "djangocms_text_ckeditor.text", "pk": 1}]	This is the...	14	3
12	1	1	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": null, "page": 1, "published": true, "path": "", "creation_date": "2016-08-30T14:26:47.902Z", "slug": "home"}, "model": "cms.title", "pk": 1}]	Home (home, en)	22	3
13	1	1	json	[{"fields": {"changed_date": "2016-08-30T14:27:05.099Z", "language": "en", "parent": null, "numchild": 0, "creation_date": "2016-08-30T14:26:57.295Z", "depth": 1, "position": 0, "path": "0001", "placeholder": 2, "plugin_type": "TextPlugin"}, "model": "cms.cmsplugin", "pk": 1}]	1	21	3
14	3	3	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Messaging", "has_url_overwrite": false, "redirect": null, "page": 3, "published": false, "path": "messaging", "creation_date": "2016-08-30T14:27:21.709Z", "slug": "messaging"}, "model": "cms.title", "pk": 3}]	Messaging (messaging, en)	22	4
15	3	3	json	[{"fields": {"navigation_extenders": null, "site": 1, "application_namespace": null, "path": "0003", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [4], "changed_date": "2016-08-30T14:27:21.722Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2016-08-30T14:27:21.663Z", "application_urls": null, "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 3}]	Messaging	13	4
16	4	4	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 4}]	content	12	4
17	3	3	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Messaging", "has_url_overwrite": false, "redirect": "", "page": 3, "published": false, "path": "messaging", "creation_date": "2016-08-30T14:27:21.709Z", "slug": "messaging"}, "model": "cms.title", "pk": 3}]	Messaging (messaging, en)	22	5
18	3	3	json	[{"fields": {"navigation_extenders": "", "site": 1, "application_namespace": null, "path": "0003", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [4], "changed_date": "2016-08-30T14:27:30.173Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": false, "publication_date": null, "creation_date": "2016-08-30T14:27:21.663Z", "application_urls": "MessagingApp", "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 3}]	Messaging	13	5
19	4	4	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 4}]	content	12	5
20	3	3	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Messaging", "has_url_overwrite": false, "redirect": "", "page": 3, "published": true, "path": "messaging", "creation_date": "2016-08-30T14:27:21.709Z", "slug": "messaging"}, "model": "cms.title", "pk": 3}]	Messaging (messaging, en)	22	6
21	3	3	json	[{"fields": {"navigation_extenders": "", "site": 1, "application_namespace": null, "path": "0003", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [4], "changed_date": "2016-08-30T14:27:35.444Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": false, "publication_date": "2016-08-30T14:27:35.262Z", "creation_date": "2016-08-30T14:27:21.663Z", "application_urls": "MessagingApp", "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 3}]	Messaging	13	6
22	4	4	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 4}]	content	12	6
23	1	1	json	[{"fields": {"navigation_extenders": null, "site": 1, "application_namespace": null, "path": "0001", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [2], "changed_date": "2016-08-30T14:27:35.629Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": true, "publication_date": "2016-08-30T14:26:47.934Z", "creation_date": "2016-08-30T14:26:47.866Z", "application_urls": null, "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 1}]	Home	13	7
24	2	2	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 2}]	content	12	7
25	3	3	json	[{"fields": {"changed_date": "2016-08-30T14:33:33.093Z", "language": "en", "parent": null, "numchild": 0, "creation_date": "2016-08-30T14:33:33.083Z", "depth": 1, "position": 1, "path": "0003", "placeholder": 2, "plugin_type": "NotificationsPlugin"}, "model": "cms.cmsplugin", "pk": 3}]	3	21	7
26	1	1	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": null, "page": 1, "published": true, "path": "", "creation_date": "2016-08-30T14:26:47.902Z", "slug": "home"}, "model": "cms.title", "pk": 1}]	Home (home, en)	22	7
27	1	1	json	[{"fields": {"body": "<p>This is the Django CMS home page.</p>\\n"}, "model": "djangocms_text_ckeditor.text", "pk": 1}]	This is the...	14	7
28	1	1	json	[{"fields": {"changed_date": "2016-08-30T14:27:05.099Z", "language": "en", "parent": null, "numchild": 0, "creation_date": "2016-08-30T14:26:57.295Z", "depth": 1, "position": 0, "path": "0001", "placeholder": 2, "plugin_type": "TextPlugin"}, "model": "cms.cmsplugin", "pk": 1}]	1	21	7
29	1	1	json	[{"fields": {"navigation_extenders": null, "site": 1, "application_namespace": null, "path": "0001", "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "en", "publication_end_date": null, "template": "INHERIT", "placeholders": [2], "changed_date": "2016-08-30T14:33:37.148Z", "limit_visibility_in_menu": null, "parent": null, "numchild": 0, "soft_root": false, "is_home": true, "publication_date": "2016-08-30T14:26:47.934Z", "creation_date": "2016-08-30T14:26:47.866Z", "application_urls": null, "changed_by": "admin", "xframe_options": 0, "depth": 1, "revision_id": 0}, "model": "cms.page", "pk": 1}]	Home	13	8
30	2	2	json	[{"fields": {"slot": "content", "default_width": null}, "model": "cms.placeholder", "pk": 2}]	content	12	8
31	3	3	json	[{"fields": {"changed_date": "2016-08-30T14:33:33.093Z", "language": "en", "parent": null, "numchild": 0, "creation_date": "2016-08-30T14:33:33.083Z", "depth": 1, "position": 1, "path": "0003", "placeholder": 2, "plugin_type": "NotificationsPlugin"}, "model": "cms.cmsplugin", "pk": 3}]	3	21	8
32	1	1	json	[{"fields": {"menu_title": "", "meta_description": "", "page_title": "", "language": "en", "title": "Home", "has_url_overwrite": false, "redirect": null, "page": 1, "published": true, "path": "", "creation_date": "2016-08-30T14:26:47.902Z", "slug": "home"}, "model": "cms.title", "pk": 1}]	Home (home, en)	22	8
33	1	1	json	[{"fields": {"body": "<p>This is the Django CMS home page.</p>\\n"}, "model": "djangocms_text_ckeditor.text", "pk": 1}]	This is the...	14	8
34	1	1	json	[{"fields": {"changed_date": "2016-08-30T14:27:05.099Z", "language": "en", "parent": null, "numchild": 0, "creation_date": "2016-08-30T14:26:57.295Z", "depth": 1, "position": 0, "path": "0001", "placeholder": 2, "plugin_type": "TextPlugin"}, "model": "cms.cmsplugin", "pk": 1}]	1	21	8
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reversion_version_id_seq', 34, true);


--
-- Data for Name: vle_coursekvstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vle_coursekvstore (id, vle_course_id, name) FROM stdin;
1	plugins	Plugins
\.


--
-- Name: vle_coursekvstore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vle_coursekvstore_id_seq', 1, true);


--
-- Data for Name: vle_coursemember; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vle_coursemember (id, vle_course_id, is_tutor, user_id) FROM stdin;
1	plugins	f	2
\.


--
-- Name: vle_coursemember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vle_coursemember_id_seq', 1, true);


--
-- Data for Name: vle_groupkvstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vle_groupkvstore (id, vle_course_id, vle_group_id, name) FROM stdin;
1	plugins	A	Group A
\.


--
-- Name: vle_groupkvstore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vle_groupkvstore_id_seq', 1, true);


--
-- Data for Name: vle_groupmember; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vle_groupmember (id, vle_course_id, vle_group_id, user_id) FROM stdin;
1	plugins	A	2
\.


--
-- Name: vle_groupmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vle_groupmember_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_aliaspluginmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_cmsplugin_path_7692c19a7d5df9d5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_path_7692c19a7d5df9d5_uniq UNIQUE (path);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_site_globalpagepermission_id_site__key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_site_globalpagepermission_id_site__key UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_path_518270318703c18f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_path_518270318703c18f_uniq UNIQUE (path);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_placeholder_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_placeholder_id_key UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_is_draft_7597e61e0082d3aa_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_is_draft_7597e61e0082d3aa_uniq UNIQUE (publisher_is_draft, site_id, application_namespace);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_page_reverse_id_a864144bd3516c9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_reverse_id_a864144bd3516c9_uniq UNIQUE (reverse_id, site_id, publisher_is_draft);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_placeholderreference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cms_placeholderreference_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_staticplaceholder_code_6c6b490a9fe0e459_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_code_6c6b490a9fe0e459_uniq UNIQUE (code, site_id);


--
-- Name: cms_staticplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_7a69dc7eaf856287_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_7a69dc7eaf856287_uniq UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cms_title_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_urlconfrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_urlconfrevision
    ADD CONSTRAINT cms_urlconfrevision_pkey PRIMARY KEY (id);


--
-- Name: cms_usersettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_pkey PRIMARY KEY (id);


--
-- Name: cms_usersettings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_2086d8a5bb1afc06_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_2086d8a5bb1afc06_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_cron_cronjoblog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_cron_cronjoblog
    ADD CONSTRAINT django_cron_cronjoblog_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djangocms_style_style_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY djangocms_style_style
    ADD CONSTRAINT djangocms_style_style_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_text_ckeditor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY djangocms_text_ckeditor_text
    ADD CONSTRAINT djangocms_text_ckeditor_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: into_oauth_oauthsignout_application_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY into_oauth_oauthsignout
    ADD CONSTRAINT into_oauth_oauthsignout_application_id_key UNIQUE (application_id);


--
-- Name: into_oauth_oauthsignout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY into_oauth_oauthsignout
    ADD CONSTRAINT into_oauth_oauthsignout_pkey PRIMARY KEY (id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: messaging_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_message
    ADD CONSTRAINT messaging_message_pkey PRIMARY KEY (id);


--
-- Name: messaging_messageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messageattachment
    ADD CONSTRAINT messaging_messageattachment_pkey PRIMARY KEY (id);


--
-- Name: messaging_messageitem_message_id_1645f99e78b6bb19_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messageitem
    ADD CONSTRAINT messaging_messageitem_message_id_1645f99e78b6bb19_uniq UNIQUE (message_id, user_id);


--
-- Name: messaging_messageitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messageitem
    ADD CONSTRAINT messaging_messageitem_pkey PRIMARY KEY (id);


--
-- Name: messaging_messagetargetcourse_message_id_76ad297b9a8d693e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messagetargetcourse
    ADD CONSTRAINT messaging_messagetargetcourse_message_id_76ad297b9a8d693e_uniq UNIQUE (message_id, vle_course_id);


--
-- Name: messaging_messagetargetcourse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messagetargetcourse
    ADD CONSTRAINT messaging_messagetargetcourse_pkey PRIMARY KEY (id);


--
-- Name: messaging_messagetargetgroup_message_id_2cb9a3bf986841d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messagetargetgroup
    ADD CONSTRAINT messaging_messagetargetgroup_message_id_2cb9a3bf986841d_uniq UNIQUE (message_id, vle_course_id, vle_group_id);


--
-- Name: messaging_messagetargetgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messagetargetgroup
    ADD CONSTRAINT messaging_messagetargetgroup_pkey PRIMARY KEY (id);


--
-- Name: messaging_messagetargetuser_message_id_79ddf788a925974c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messagetargetuser
    ADD CONSTRAINT messaging_messagetargetuser_message_id_79ddf788a925974c_uniq UNIQUE (message_id, user_id);


--
-- Name: messaging_messagetargetuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messaging_messagetargetuser
    ADD CONSTRAINT messaging_messagetargetuser_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: vle_coursekvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_coursekvstore
    ADD CONSTRAINT vle_coursekvstore_pkey PRIMARY KEY (id);


--
-- Name: vle_coursekvstore_vle_course_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_coursekvstore
    ADD CONSTRAINT vle_coursekvstore_vle_course_id_key UNIQUE (vle_course_id);


--
-- Name: vle_coursemember_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_coursemember
    ADD CONSTRAINT vle_coursemember_pkey PRIMARY KEY (id);


--
-- Name: vle_coursemember_user_id_3b75f7cabc2bcee7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_coursemember
    ADD CONSTRAINT vle_coursemember_user_id_3b75f7cabc2bcee7_uniq UNIQUE (user_id, vle_course_id);


--
-- Name: vle_groupkvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_groupkvstore
    ADD CONSTRAINT vle_groupkvstore_pkey PRIMARY KEY (id);


--
-- Name: vle_groupkvstore_vle_course_id_52c196056a86cf6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_groupkvstore
    ADD CONSTRAINT vle_groupkvstore_vle_course_id_52c196056a86cf6_uniq UNIQUE (vle_course_id, vle_group_id);


--
-- Name: vle_groupmember_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_groupmember
    ADD CONSTRAINT vle_groupmember_pkey PRIMARY KEY (id);


--
-- Name: vle_groupmember_user_id_37b24c55d3ef8b6c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vle_groupmember
    ADD CONSTRAINT vle_groupmember_user_id_37b24c55d3ef8b6c_uniq UNIQUE (user_id, vle_course_id, vle_group_id);


--
-- Name: auth_group_name_6bde41131930bbea_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_6bde41131930bbea_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_fa32edb053bbc09_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_fa32edb053bbc09_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_aliaspluginmodel_921abf5c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_aliaspluginmodel_921abf5c ON cms_aliaspluginmodel USING btree (alias_placeholder_id);


--
-- Name: cms_aliaspluginmodel_b25eaab4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_aliaspluginmodel_b25eaab4 ON cms_aliaspluginmodel USING btree (plugin_id);


--
-- Name: cms_cmsplugin_667a6151; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_667a6151 ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_6be37982; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_6be37982 ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_8512ae7d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_8512ae7d ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_b5e4cf8f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_b5e4cf8f ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_language_25e8267b6b921b3c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_25e8267b6b921b3c_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_path_7692c19a7d5df9d5_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_path_7692c19a7d5df9d5_like ON cms_cmsplugin USING btree (path varchar_pattern_ops);


--
-- Name: cms_cmsplugin_plugin_type_13246ba49a202411_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_13246ba49a202411_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_globalpagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_0e939a4f ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_e8701ad4 ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_globalpagepermission_sites_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_9365d6e7 ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_sites_a3d12ecd; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_a3d12ecd ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_page_1d85575d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_1d85575d ON cms_page USING btree (soft_root);


--
-- Name: cms_page_2247c5f0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_2247c5f0 ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_3d9ef52f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_3d9ef52f ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_4fa1c803; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_4fa1c803 ON cms_page USING btree (is_home);


--
-- Name: cms_page_6be37982; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_6be37982 ON cms_page USING btree (parent_id);


--
-- Name: cms_page_7b8acfa6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_7b8acfa6 ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_9365d6e7 ON cms_page USING btree (site_id);


--
-- Name: cms_page_93b83098; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_93b83098 ON cms_page USING btree (publication_date);


--
-- Name: cms_page_application_urls_55ae69847a069593_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_application_urls_55ae69847a069593_like ON cms_page USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_page_b7700099; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_b7700099 ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_cb540373; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_cb540373 ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_db3eb53f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_db3eb53f ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_e721871e; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_e721871e ON cms_page USING btree (application_urls);


--
-- Name: cms_page_navigation_extenders_273e8b3b3d661759_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_273e8b3b3d661759_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_path_518270318703c18f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_path_518270318703c18f_like ON cms_page USING btree (path varchar_pattern_ops);


--
-- Name: cms_page_placeholders_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_placeholders_1a63c800 ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_667a6151; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_placeholders_667a6151 ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_reverse_id_5b199d3a21c59064_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_5b199d3a21c59064_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_pagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagepermission_0e939a4f ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagepermission_1a63c800 ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagepermission_e8701ad4 ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_e93cb7eb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pageuser_e93cb7eb ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_e93cb7eb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pageusergroup_e93cb7eb ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_5e97994e; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_placeholder_5e97994e ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_5bd367f0f4cc7d75_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_5bd367f0f4cc7d75_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_placeholderreference_328d0afc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_placeholderreference_328d0afc ON cms_placeholderreference USING btree (placeholder_ref_id);


--
-- Name: cms_staticplaceholder_1ee2744d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_1ee2744d ON cms_staticplaceholder USING btree (public_id);


--
-- Name: cms_staticplaceholder_5cb48773; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_5cb48773 ON cms_staticplaceholder USING btree (draft_id);


--
-- Name: cms_staticplaceholder_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_9365d6e7 ON cms_staticplaceholder USING btree (site_id);


--
-- Name: cms_title_1268de9a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_1268de9a ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_1a63c800 ON cms_title USING btree (page_id);


--
-- Name: cms_title_2dbcba41; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_2dbcba41 ON cms_title USING btree (slug);


--
-- Name: cms_title_8512ae7d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_8512ae7d ON cms_title USING btree (language);


--
-- Name: cms_title_b7700099; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_b7700099 ON cms_title USING btree (publisher_is_draft);


--
-- Name: cms_title_d6fe1d0b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_d6fe1d0b ON cms_title USING btree (path);


--
-- Name: cms_title_f7202fc0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_f7202fc0 ON cms_title USING btree (publisher_state);


--
-- Name: cms_title_language_485fe28eccda6924_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_language_485fe28eccda6924_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_path_340447daeb3069bd_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_path_340447daeb3069bd_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_slug_5affc35728a8631_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_slug_5affc35728a8631_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cms_usersettings_2655b062; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_usersettings_2655b062 ON cms_usersettings USING btree (clipboard_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_cron_cronjoblog_305d2889; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_305d2889 ON django_cron_cronjoblog USING btree (end_time);


--
-- Name: django_cron_cronjoblog_a05e4b70; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_a05e4b70 ON django_cron_cronjoblog USING btree (ran_at_time);


--
-- Name: django_cron_cronjoblog_c1336794; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_c1336794 ON django_cron_cronjoblog USING btree (code);


--
-- Name: django_cron_cronjoblog_c4d98dbd; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_c4d98dbd ON django_cron_cronjoblog USING btree (start_time);


--
-- Name: django_cron_cronjoblog_code_2f057d1bb457cb7a_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_code_2f057d1bb457cb7a_like ON django_cron_cronjoblog USING btree (code varchar_pattern_ops);


--
-- Name: django_cron_cronjoblog_code_4e16f5a60e31a319_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_code_4e16f5a60e31a319_idx ON django_cron_cronjoblog USING btree (code, start_time);


--
-- Name: django_cron_cronjoblog_code_633b08e9abde5764_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_code_633b08e9abde5764_idx ON django_cron_cronjoblog USING btree (code, start_time, ran_at_time);


--
-- Name: django_cron_cronjoblog_code_754ef82e28dbbaf4_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_cron_cronjoblog_code_754ef82e28dbbaf4_idx ON django_cron_cronjoblog USING btree (code, is_success, ran_at_time);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_2e62ee7421ad42b5_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_2e62ee7421ad42b5_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: messaging_message_0a7be3b3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_0a7be3b3 ON messaging_message USING btree (target_all);


--
-- Name: messaging_message_3cfbd988; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_3cfbd988 ON messaging_message USING btree (rght);


--
-- Name: messaging_message_656442a0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_656442a0 ON messaging_message USING btree (tree_id);


--
-- Name: messaging_message_6be37982; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_6be37982 ON messaging_message USING btree (parent_id);


--
-- Name: messaging_message_789183b7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_789183b7 ON messaging_message USING btree (sent);


--
-- Name: messaging_message_c9e9a848; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_c9e9a848 ON messaging_message USING btree (level);


--
-- Name: messaging_message_caf7cc51; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_caf7cc51 ON messaging_message USING btree (lft);


--
-- Name: messaging_message_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_message_e8701ad4 ON messaging_message USING btree (user_id);


--
-- Name: messaging_messageattachment_4ccaa172; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messageattachment_4ccaa172 ON messaging_messageattachment USING btree (message_id);


--
-- Name: messaging_messageitem_4ccaa172; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messageitem_4ccaa172 ON messaging_messageitem USING btree (message_id);


--
-- Name: messaging_messageitem_da602f0b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messageitem_da602f0b ON messaging_messageitem USING btree (deleted);


--
-- Name: messaging_messageitem_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messageitem_e8701ad4 ON messaging_messageitem USING btree (user_id);


--
-- Name: messaging_messageitem_ecae1311; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messageitem_ecae1311 ON messaging_messageitem USING btree (read);


--
-- Name: messaging_messagetargetcour_vle_course_id_47995fa2b9f9cf38_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetcour_vle_course_id_47995fa2b9f9cf38_like ON messaging_messagetargetcourse USING btree (vle_course_id varchar_pattern_ops);


--
-- Name: messaging_messagetargetcourse_4ccaa172; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetcourse_4ccaa172 ON messaging_messagetargetcourse USING btree (message_id);


--
-- Name: messaging_messagetargetcourse_a02158e9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetcourse_a02158e9 ON messaging_messagetargetcourse USING btree (vle_course_id);


--
-- Name: messaging_messagetargetgroup_4ccaa172; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetgroup_4ccaa172 ON messaging_messagetargetgroup USING btree (message_id);


--
-- Name: messaging_messagetargetgroup_9309a986; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetgroup_9309a986 ON messaging_messagetargetgroup USING btree (vle_group_id);


--
-- Name: messaging_messagetargetgroup_a02158e9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetgroup_a02158e9 ON messaging_messagetargetgroup USING btree (vle_course_id);


--
-- Name: messaging_messagetargetgroup_vle_course_id_8acf15ecd51f6d9_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetgroup_vle_course_id_8acf15ecd51f6d9_like ON messaging_messagetargetgroup USING btree (vle_course_id varchar_pattern_ops);


--
-- Name: messaging_messagetargetgroup_vle_group_id_650dfa7956350430_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetgroup_vle_group_id_650dfa7956350430_like ON messaging_messagetargetgroup USING btree (vle_group_id varchar_pattern_ops);


--
-- Name: messaging_messagetargetuser_4ccaa172; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetuser_4ccaa172 ON messaging_messagetargetuser USING btree (message_id);


--
-- Name: messaging_messagetargetuser_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messaging_messagetargetuser_e8701ad4 ON messaging_messagetargetuser USING btree (user_id);


--
-- Name: oauth2_provider_accesstoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_accesstoken_6bc0a4eb ON oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_94a08da1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_accesstoken_94a08da1 ON oauth2_provider_accesstoken USING btree (token);


--
-- Name: oauth2_provider_accesstoken_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_accesstoken_e8701ad4 ON oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_accesstoken_token_445c5877e7d791d6_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_accesstoken_token_445c5877e7d791d6_like ON oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_application_9d667c2b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_application_9d667c2b ON oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_id_4ea6f2a9d08e2e2e_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_application_client_id_4ea6f2a9d08e2e2e_like ON oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_7fe1e3e860384ff_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_application_client_secret_7fe1e3e860384ff_like ON oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_application_e8701ad4 ON oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_6bc0a4eb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_grant_6bc0a4eb ON oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_c1336794; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_grant_c1336794 ON oauth2_provider_grant USING btree (code);


--
-- Name: oauth2_provider_grant_code_646e22a35107b303_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_grant_code_646e22a35107b303_like ON oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_grant_e8701ad4 ON oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_refreshtoken_6bc0a4eb ON oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_94a08da1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_refreshtoken_94a08da1 ON oauth2_provider_refreshtoken USING btree (token);


--
-- Name: oauth2_provider_refreshtoken_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_refreshtoken_e8701ad4 ON oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_token_3a528ed1e6b59ef_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth2_provider_refreshtoken_token_3a528ed1e6b59ef_like ON oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- Name: reversion_revision_b16b0f06; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_b16b0f06 ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_c69e55a4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_c69e55a4 ON reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_e8701ad4 ON reversion_revision USING btree (user_id);


--
-- Name: reversion_revision_manager_slug_54d21219582503b1_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_54d21219582503b1_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_version_0c9ba3a3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_0c9ba3a3 ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_417f1b1c ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_5de09a8d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_5de09a8d ON reversion_version USING btree (revision_id);


--
-- Name: vle_coursekvstore_vle_course_id_19f341026bee5e1f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_coursekvstore_vle_course_id_19f341026bee5e1f_like ON vle_coursekvstore USING btree (vle_course_id varchar_pattern_ops);


--
-- Name: vle_coursemember_37d6497a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_coursemember_37d6497a ON vle_coursemember USING btree (is_tutor);


--
-- Name: vle_coursemember_a02158e9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_coursemember_a02158e9 ON vle_coursemember USING btree (vle_course_id);


--
-- Name: vle_coursemember_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_coursemember_e8701ad4 ON vle_coursemember USING btree (user_id);


--
-- Name: vle_coursemember_vle_course_id_26c38ed78d3f63fa_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_coursemember_vle_course_id_26c38ed78d3f63fa_like ON vle_coursemember USING btree (vle_course_id varchar_pattern_ops);


--
-- Name: vle_groupkvstore_9309a986; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupkvstore_9309a986 ON vle_groupkvstore USING btree (vle_group_id);


--
-- Name: vle_groupkvstore_a02158e9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupkvstore_a02158e9 ON vle_groupkvstore USING btree (vle_course_id);


--
-- Name: vle_groupkvstore_vle_course_id_5f7c7fdd600996ce_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupkvstore_vle_course_id_5f7c7fdd600996ce_like ON vle_groupkvstore USING btree (vle_course_id varchar_pattern_ops);


--
-- Name: vle_groupkvstore_vle_group_id_164858243ae234c5_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupkvstore_vle_group_id_164858243ae234c5_like ON vle_groupkvstore USING btree (vle_group_id varchar_pattern_ops);


--
-- Name: vle_groupmember_9309a986; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupmember_9309a986 ON vle_groupmember USING btree (vle_group_id);


--
-- Name: vle_groupmember_a02158e9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupmember_a02158e9 ON vle_groupmember USING btree (vle_course_id);


--
-- Name: vle_groupmember_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupmember_e8701ad4 ON vle_groupmember USING btree (user_id);


--
-- Name: vle_groupmember_vle_course_id_504915309cf9cc53_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupmember_vle_course_id_504915309cf9cc53_like ON vle_groupmember USING btree (vle_course_id varchar_pattern_ops);


--
-- Name: vle_groupmember_vle_group_id_10d29ad245cdd6aa_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX vle_groupmember_vle_group_id_10d29ad245cdd6aa_like ON vle_groupmember USING btree (vle_group_id varchar_pattern_ops);


--
-- Name: D0483c88700614fd6c5c84b124583720; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT "D0483c88700614fd6c5c84b124583720" FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D98064d3cec57536c1270f8c9ddc9a6b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT "D98064d3cec57536c1270f8c9ddc9a6b" FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: a220b01f74675bbe389106551c467b30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT a220b01f74675bbe389106551c467b30 FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_511077ac34725d8a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_511077ac34725d8a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_group_id_4ea7cc02b4e18eb_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_group_id_4ea7cc02b4e18eb_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_3790968156f739fd_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_3790968156f739fd_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_5818e8dba4127031_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_5818e8dba4127031_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_d801e79457ead29_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_d801e79457ead29_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_21201e2187b7c441_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_21201e2187b7c441_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissi_user_id_25c07bbaf4dad19_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissi_user_id_25c07bbaf4dad19_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: b405dd8c9c5e3c19fd109e12693969f7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT b405dd8c9c5e3c19fd109e12693969f7 FOREIGN KEY (access_token_id) REFERENCES oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bcb3e675fea7f067e8892528f1e65c6d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY into_oauth_oauthsignout
    ADD CONSTRAINT bcb3e675fea7f067e8892528f1e65c6d FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_alias_placeholder_id_19ff87f4b6506f7d_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_alias_placeholder_id_19ff87f4b6506f7d_fk_cms_placeholder_id FOREIGN KEY (alias_placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_aliasp_cmsplugin_ptr_id_a146238a4a634c4_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliasp_cmsplugin_ptr_id_a146238a4a634c4_fk_cms_cmsplugin_id FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_aliaspluginm_plugin_id_6cb0e8f62e7b802f_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginm_plugin_id_6cb0e8f62e7b802f_fk_cms_cmsplugin_id FOREIGN KEY (plugin_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmspl_placeholder_id_45e08772be34ec0f_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmspl_placeholder_id_45e08772be34ec0f_fk_cms_placeholder_id FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin_parent_id_3227a3752b89b923_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_parent_id_3227a3752b89b923_fk_cms_cmsplugin_id FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermis_group_id_5495c04a8b715951_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermis_group_id_5495c04a8b715951_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermis_site_id_2805b267618ef941_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermis_site_id_2805b267618ef941_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermissi_user_id_5b7e387d572f1d18_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermissi_user_id_5b7e387d572f1d18_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_p_placeholder_ref_id_6d7ea115a2f488ec_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cms_p_placeholder_ref_id_6d7ea115a2f488ec_fk_cms_placeholder_id FOREIGN KEY (placeholder_ref_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page__placeholder_id_1e2710bd8c76d9ad_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page__placeholder_id_1e2710bd8c76d9ad_fk_cms_placeholder_id FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_parent_id_3a1df0ef76fe1197_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_parent_id_3a1df0ef76fe1197_fk_cms_page_id FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders_page_id_2339fb692425adb6_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_2339fb692425adb6_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_publisher_public_id_6d3414df27b14e29_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_6d3414df27b14e29_fk_cms_page_id FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_site_id_74f6849b7245e838_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_site_id_74f6849b7245e838_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_group_id_39f298fdb5026_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_group_id_39f298fdb5026_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_page_id_214a878c4fb6ec65_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_page_id_214a878c4fb6ec65_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_user_id_b6429a51a3e8e53_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_user_id_b6429a51a3e8e53_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_created_by_id_18eb7aa0ce6f1c16_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_created_by_id_18eb7aa0ce6f1c16_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_user_ptr_id_7b1c6e2f6b58ccde_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_user_ptr_id_7b1c6e2f6b58ccde_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergrou_group_ptr_id_2fed9cde9e11700f_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergrou_group_ptr_id_2fed9cde9e11700f_fk_auth_group_id FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_created_by_id_53218d1b0250196_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_created_by_id_53218d1b0250196_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_place_cmsplugin_ptr_id_57d93b52c864bee6_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cms_place_cmsplugin_ptr_id_57d93b52c864bee6_fk_cms_cmsplugin_id FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplac_public_id_20b32af3aef57809_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplac_public_id_20b32af3aef57809_fk_cms_placeholder_id FOREIGN KEY (public_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplace_draft_id_6c2edc7f36488820_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplace_draft_id_6c2edc7f36488820_fk_cms_placeholder_id FOREIGN KEY (draft_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholde_site_id_65c8a138163af08f_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholde_site_id_65c8a138163af08f_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_page_id_527ebd61f3936a12_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_page_id_527ebd61f3936a12_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_publisher_public_id_74e956b52b3e4a1d_fk_cms_title_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_74e956b52b3e4a1d_fk_cms_title_id FOREIGN KEY (publisher_public_id) REFERENCES cms_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_userset_clipboard_id_15eac87d124304f3_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_userset_clipboard_id_15eac87d124304f3_fk_cms_placeholder_id FOREIGN KEY (clipboard_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_usersettings_user_id_2cfe7a2128ccc2b3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_2cfe7a2128ccc2b3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_3a013be961a57126_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_3a013be961a57126_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_66c4fd751edb4af3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_66c4fd751edb4af3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_cmsplugin_ptr_id_5cfb7ff7d38a35c0_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY djangocms_text_ckeditor_text
    ADD CONSTRAINT djangocms_cmsplugin_ptr_id_5cfb7ff7d38a35c0_fk_cms_cmsplugin_id FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_cmsplugin_ptr_id_661880b8f081b307_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY djangocms_style_style
    ADD CONSTRAINT djangocms_cmsplugin_ptr_id_661880b8f081b307_fk_cms_cmsplugin_id FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e1f6e04d85328b41a00c7676eee76587; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT e1f6e04d85328b41a00c7676eee76587 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_m_message_id_273a6b757d3b2e2d_fk_messaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetcourse
    ADD CONSTRAINT messaging_m_message_id_273a6b757d3b2e2d_fk_messaging_message_id FOREIGN KEY (message_id) REFERENCES messaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_m_message_id_4b1016ed5b77958c_fk_messaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetgroup
    ADD CONSTRAINT messaging_m_message_id_4b1016ed5b77958c_fk_messaging_message_id FOREIGN KEY (message_id) REFERENCES messaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_m_message_id_63e49e526eacd5cb_fk_messaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetuser
    ADD CONSTRAINT messaging_m_message_id_63e49e526eacd5cb_fk_messaging_message_id FOREIGN KEY (message_id) REFERENCES messaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_m_message_id_6c542d37d4419cb0_fk_messaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messageitem
    ADD CONSTRAINT messaging_m_message_id_6c542d37d4419cb0_fk_messaging_message_id FOREIGN KEY (message_id) REFERENCES messaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_me_message_id_9bc1078ef91ad4c_fk_messaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messageattachment
    ADD CONSTRAINT messaging_me_message_id_9bc1078ef91ad4c_fk_messaging_message_id FOREIGN KEY (message_id) REFERENCES messaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_me_parent_id_4be47ed27403ca49_fk_messaging_message_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message
    ADD CONSTRAINT messaging_me_parent_id_4be47ed27403ca49_fk_messaging_message_id FOREIGN KEY (parent_id) REFERENCES messaging_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_message_user_id_6fbb92de51aab142_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message
    ADD CONSTRAINT messaging_message_user_id_6fbb92de51aab142_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_messageitem_user_id_515057b70c439a25_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messageitem
    ADD CONSTRAINT messaging_messageitem_user_id_515057b70c439a25_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_messagetarge_user_id_2540b9670c45810a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_messagetargetuser
    ADD CONSTRAINT messaging_messagetarge_user_id_2540b9670c45810a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesst_user_id_4a88adaf597c286_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesst_user_id_4a88adaf597c286_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_applic_user_id_2a1f6996100ae2dd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_applic_user_id_2a1f6996100ae2dd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant_user_id_6b82b307bca4e364_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_6b82b307bca4e364_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refres_user_id_70e9e9b61f77a99b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refres_user_id_70e9e9b61f77a99b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rever_content_type_id_c01a11926d4c4a9_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT rever_content_type_id_c01a11926d4c4a9_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion__revision_id_48ec3744916a950_fk_reversion_revision_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion__revision_id_48ec3744916a950_fk_reversion_revision_id FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision_user_id_53d027e45b2ec55e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_53d027e45b2ec55e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vle_coursemember_user_id_f7a34c604ff6c54_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vle_coursemember
    ADD CONSTRAINT vle_coursemember_user_id_f7a34c604ff6c54_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vle_groupmember_user_id_2a795a242d399aad_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vle_groupmember
    ADD CONSTRAINT vle_groupmember_user_id_2a795a242d399aad_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


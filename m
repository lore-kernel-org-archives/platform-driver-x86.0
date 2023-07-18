Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3F8EB64DA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Jul 2023 10:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjGRKzj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Jul 2023 06:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjGRKzi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Jul 2023 06:55:38 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C5EE60
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jul 2023 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689677735; x=1721213735;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GGNNNlOEXaCus2zmP5N8Sf5g6ZyJiM7ZpGSjGwVcg+I=;
  b=c0Xuvo9Jfc8GK+L9nXorgIj7CTg+l5pL5M8sEeA0jR8ljto+SHcZVVNP
   y05b/ZkhDxkrKXKPwMbwcG63r5/7WpkCgG0diEgTYf8cQZsHnppMHKvbZ
   5PzP8+C816DCV2kj4U02DgA/PG9sdnEfM7iRPazLr80qV/OuPfuQUUuYN
   54iqwudsXDaLGMi+HAcuRAwltdpS1hn3kkFtb8cHGPJ+lOgQ/0lAELXtk
   iCjtJ7R54VbB2pNRNClgVgk7nOHFj5hGxSb6MB9SYY3OE5/3ecWZitgEe
   UrTIQfnKFQeH+e3T9rG4kjTNvZrvmdXtr3rZcwJPryrQmRc4kZlpAD8vY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452553483"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="452553483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 03:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673863752"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="673863752"
Received: from ijarvine-mobl2.ger.corp.intel.com ([10.252.47.53])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 03:55:33 -0700
Date:   Tue, 18 Jul 2023 13:55:32 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>, jorge.lopez2@hp.com
cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [bug report] platform/x86: hp-bioscfg: enum-attributes
In-Reply-To: <176e14a2-41f8-41b2-854e-77319ec2416d@moroto.mountain>
Message-ID: <18c3c8c6-52d4-dbde-7fd9-2335974bdfd7@linux.intel.com>
References: <176e14a2-41f8-41b2-854e-77319ec2416d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 17 Jul 2023, Dan Carpenter wrote:

> Hello Jorge Lopez,
> 
> The patch 6b2770bfd6f9: "platform/x86: hp-bioscfg: enum-attributes"
> from Jun 8, 2023 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:285 hp_populate_enumeration_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:289 hp_populate_enumeration_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:263 hp_populate_integer_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:286 hp_populate_ordered_list_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:290 hp_populate_ordered_list_elements_from_package() error: double free of 'tmpstr'
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:291 hp_populate_ordered_list_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:371 hp_populate_password_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:252 hp_populate_string_elements_from_package() error: double free of 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:256 hp_populate_string_elements_from_package() error: double free of 'str_value'
> 
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>     125 static int hp_populate_enumeration_elements_from_package(union acpi_object *enum_obj,
>     126                                                          int enum_obj_count,
>     127                                                          int instance_id)
>     128 {
>     129         char *str_value = NULL;
> 
> str_value starts as NULL.
> 
>     130         int value_len;
>     131         u32 size = 0;
>     132         u32 int_value;
>     133         int elem = 0;
>     134         int reqs;
>     135         int pos_values;
>     136         int ret;
>     137         int eloc;
>     138         struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
>     139 
>     140         for (elem = 1, eloc = 1; elem < enum_obj_count; elem++, eloc++) {
>     141                 /* ONLY look at the first ENUM_ELEM_CNT elements */
>     142                 if (eloc == ENUM_ELEM_CNT)
>     143                         goto exit_enumeration_package;
> 
> But here we free the str_value from the previous iteration.
> 
>     144 
>     145                 switch (enum_obj[elem].type) {
>     146                 case ACPI_TYPE_STRING:
>     147                         if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
>     148                                 ret = hp_convert_hexstr_to_str(enum_obj[elem].string.pointer,
>     149                                                                enum_obj[elem].string.length,
>     150                                                                &str_value, &value_len);
>     151                                 if (ret)
>     152                                         return -EINVAL;
> 
> Here the str_value from the previos iteration is re-assigned without
> being freed.  (memory leak).
> 
>     153                         }
>     154                         break;
>     155                 case ACPI_TYPE_INTEGER:
>     156                         int_value = (u32)enum_obj[elem].integer.value;
>     157                         break;
>     158                 default:
>     159                         pr_warn("Unsupported object type [%d]\n", enum_obj[elem].type);
>     160                         continue;
>     161                 }
>     162 
>     163                 /* Check that both expected and read object type match */
>     164                 if (expected_enum_types[eloc] != enum_obj[elem].type) {
>     165                         pr_err("Error expected type %d for elem %d, but got type %d instead\n",
>     166                                expected_enum_types[eloc], elem, enum_obj[elem].type);
>     167                         return -EIO;
>     168                 }
>     169 
>     170                 /* Assign appropriate element value to corresponding field */
>     171                 switch (eloc) {
>     172                 case NAME:
>     173                 case VALUE:
>     174                         break;
>     175                 case PATH:
>     176                         strscpy(enum_data->common.path, str_value,
> 
> If str_value is NULL this will crash.
> 
>     177                                 sizeof(enum_data->common.path));
>     178                         break;
>     179                 case IS_READONLY:
>     180                         enum_data->common.is_readonly = int_value;
>     181                         break;
>     182                 case DISPLAY_IN_UI:
>     183                         enum_data->common.display_in_ui = int_value;
>     184                         break;
>     185                 case REQUIRES_PHYSICAL_PRESENCE:
>     186                         enum_data->common.requires_physical_presence = int_value;
>     187                         break;
>     188                 case SEQUENCE:
>     189                         enum_data->common.sequence = int_value;
>     190                         break;
>     191                 case PREREQUISITES_SIZE:
>     192                         enum_data->common.prerequisites_size = int_value;
>     193                         if (int_value > MAX_PREREQUISITES_SIZE)
>     194                                 pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
>     195 
>     196                         /*
>     197                          * This HACK is needed to keep the expected
>     198                          * element list pointing to the right obj[elem].type
>     199                          * when the size is zero. PREREQUISITES
>     200                          * object is omitted by BIOS when the size is
>     201                          * zero.
>     202                          */
>     203                         if (int_value == 0)
>     204                                 eloc++;
>     205                         break;
>     206 
>     207                 case PREREQUISITES:
>     208                         size = min_t(u32, enum_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
>     209                         for (reqs = 0; reqs < size; reqs++) {
>     210                                 if (elem >= enum_obj_count) {
>     211                                         pr_err("Error enum-objects package is too small\n");
>     212                                         return -EINVAL;
>     213                                 }
>     214 
>     215                                 ret = hp_convert_hexstr_to_str(enum_obj[elem + reqs].string.pointer,
>     216                                                                enum_obj[elem + reqs].string.length,
>     217                                                                &str_value, &value_len);
> 
> str_value is re-assigned again.  (memory leak).
> 
>     218 
>     219                                 if (ret)
>     220                                         return -EINVAL;
>     221 
>     222                                 strscpy(enum_data->common.prerequisites[reqs],
>     223                                         str_value,
>     224                                         sizeof(enum_data->common.prerequisites[reqs]));
>     225 
>     226                                 kfree(str_value);
> 
> str_value is freed.  (this will lead to a crash).
> 
>     227                         }
>     228                         break;
>     229 
>     230                 case SECURITY_LEVEL:
>     231                         enum_data->common.security_level = int_value;
>     232                         break;
>     233 
>     234                 case ENUM_CURRENT_VALUE:
>     235                         strscpy(enum_data->current_value,
>     236                                 str_value, sizeof(enum_data->current_value));
> 
> No check for NULL.
> 
>     237                         break;
>     238                 case ENUM_SIZE:
>     239                         enum_data->possible_values_size = int_value;
>     240                         if (int_value > MAX_VALUES_SIZE)
>     241                                 pr_warn("Possible number values size value exceeded the maximum number of elements supported or data may be malformed\n");
>     242 
>     243                         /*
>     244                          * This HACK is needed to keep the expected
>     245                          * element list pointing to the right obj[elem].type
>     246                          * when the size is zero. POSSIBLE_VALUES
>     247                          * object is omitted by BIOS when the size is zero.
>     248                          */
>     249                         if (int_value == 0)
>     250                                 eloc++;
>     251                         break;
>     252 
>     253                 case ENUM_POSSIBLE_VALUES:
>     254                         size = enum_data->possible_values_size;
>     255 
>     256                         for (pos_values = 0; pos_values < size && pos_values < MAX_VALUES_SIZE;
>     257                              pos_values++) {
>     258                                 if (elem >= enum_obj_count) {
>     259                                         pr_err("Error enum-objects package is too small\n");
>     260                                         return -EINVAL;
>     261                                 }
>     262 
>     263                                 ret = hp_convert_hexstr_to_str(enum_obj[elem + pos_values].string.pointer,
>     264                                                                enum_obj[elem + pos_values].string.length,
>     265                                                                &str_value, &value_len);
> 
> Re-assigned again.
> 
>     266 
>     267                                 if (ret)
>     268                                         return -EINVAL;
>     269 
>     270                                 /*
>     271                                  * ignore strings when possible values size
>     272                                  * is greater than MAX_VALUES_SIZE
>     273                                  */
>     274                                 if (size < MAX_VALUES_SIZE)
>     275                                         strscpy(enum_data->possible_values[pos_values],
>     276                                                 str_value,
>     277                                                 sizeof(enum_data->possible_values[pos_values]));
>     278                         }
>     279                         break;
>     280                 default:
>     281                         pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
>     282                         break;
>     283                 }
>     284 
> --> 285                 kfree(str_value);
> 
> str_value is freed at the end of every iteration so this is double free
> from the PREREQUISITES code.
> 
>     286         }
>     287 
>     288 exit_enumeration_package:
>     289         kfree(str_value);
> 
> This is a double free as well.  I don't see how this one could have been
> avoided in testing???
> 
>     290         return 0;
>     291 }

I found what looked like even triple frees during my review of this series 
against one of these constructs [1]. The whole series was full of 
copy-pasted code so the same bugs and problems probably repeat over and over.

Due to copy-pasted code, I suggested moving common code into helpers which 
would have simplified these functions significantly but like you see, not 
much really happened (and seemingly not even the bugs that I explicitly 
mentioned were addressed :-().

Diffing some of these functions yields:

...
                case PATH:
-                       strscpy(enum_data->common.path, str_value,
-                               sizeof(enum_data->common.path));
+                       strscpy(ordered_list_data->common.path, str_value,
+                               sizeof(ordered_list_data->common.path));
                        break;
                case IS_READONLY:
-                       enum_data->common.is_readonly = int_value;
+                       ordered_list_data->common.is_readonly = int_value;
                        break;
                case DISPLAY_IN_UI:
-                       enum_data->common.display_in_ui = int_value;
+                       ordered_list_data->common.display_in_ui = int_value;
                        break;
                case REQUIRES_PHYSICAL_PRESENCE:
-                       enum_data->common.requires_physical_presence = int_value;
+                       ordered_list_data->common.requires_physical_presence = int_value;
                        break;
                case SEQUENCE:
-                       enum_data->common.sequence = int_value;
+                       ordered_list_data->common.sequence = int_value;
                        break;
                case PREREQUISITES_SIZE:
-                       enum_data->common.prerequisites_size = int_value;
+                       ordered_list_data->common.prerequisites_size = int_value;
                        if (int_value > MAX_PREREQUISITES_SIZE)
                                pr_warn("Prerequisites size value exceeded the maximum number of e>
...

...that part of the struct is even called "common" so it should be pretty 
obvious there might be some common code.

[1] https://patchwork.kernel.org/project/platform-driver-x86/patch/20230505220043.39036-6-jorge.lopez2@hp.com/#25328544


-- 
 i.


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C273EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jul 2023 10:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjGQKj4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jul 2023 06:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjGQKjz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jul 2023 06:39:55 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2DE83
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jul 2023 03:39:54 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbf7fbe722so44168745e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jul 2023 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689590392; x=1692182392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuCFMsQClr5rFgpN+j3xKHrlZMkg7POCDTigrcZC/pg=;
        b=rPeGmYiTuSVoUjEme6nJzPDhb4XOea2aAJ3BGtt+Pi9XE5HDioGDdB8YQ/1bv7aZZt
         9CuzVTTZI21JRZSpouZCuA+pD84frNIt0S0WvqoSZ6vbj/ZdApDjzbugZaFqb7iWceEZ
         sH+dfoHtBVUulDenTlYs7HL7bupeTxZ6fg6L7zMreVErQoY2IwKLjw+jrND+i64DpbPu
         c8fd9VWLMgT0uzI0W138FbWwE1iAXVgFKHTbkigJZVD+VcLWXx+l5OOMT5nWO732Zc0F
         Gjlmb2gm0SxXUlKJtI369P94kdkEwqw4o4zpO1ct4IZ9L3Oj2kTyRtWUugZpbI7Ye4R1
         QwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689590392; x=1692182392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuCFMsQClr5rFgpN+j3xKHrlZMkg7POCDTigrcZC/pg=;
        b=dpC/ez39uzQXVeiLnAu3YTzTmVfW1HUKExOUMreKCBDkJuTHvsTrjIcVYKW0BCpBnR
         kMAG92lKT/rgNMEnCUdpVo3GCVNQ9HsaunXs6crYDoEPu+FLntTNtf8oqOx1+wsI2jfM
         Ci8JZlvsxxY41iqgZoFbUlHXKd0CJM1sY6K2Si74J0BlPb0yIqovHoFvwQNgRx2iSSub
         G0uQSCgTWaB5U1Bi2PwByYzov5yGVlzpDsz/pdTjUbCYd6T8wUSZFuK4SR/hHA0pdS47
         ItfC8w3LgqYFKAPp+C5V642tccOFIH4yowp0e3Uspps8AogCSxiqgFQHmGMgs/UVT4cB
         Fapg==
X-Gm-Message-State: ABy/qLZQZBpEWlTFL2zqy3oiGCpV2nLvA9mAeAP9Q8aO+WlomR+d9eY+
        e8s7CPEtUjT4jj8Vo+qvDgEdR6xhsaWtRSPdj/0=
X-Google-Smtp-Source: APBJJlHRQRZP/tomKE6Xz0dx5JRUPE1W3IrEBf9jWEPbXDjGjjpqOQUxlQxItDQ0gHFZ/hUGTmp3xA==
X-Received: by 2002:a1c:f213:0:b0:3fc:4e9:ae27 with SMTP id s19-20020a1cf213000000b003fc04e9ae27mr11210785wmc.40.1689590392602;
        Mon, 17 Jul 2023 03:39:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020a1ced07000000b003fbe561f6a3sm7682275wmh.37.2023.07.17.03.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 03:39:50 -0700 (PDT)
Date:   Mon, 17 Jul 2023 13:39:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     jorge.lopez2@hp.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: hp-bioscfg: enum-attributes
Message-ID: <176e14a2-41f8-41b2-854e-77319ec2416d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Jorge Lopez,

The patch 6b2770bfd6f9: "platform/x86: hp-bioscfg: enum-attributes"
from Jun 8, 2023 (linux-next), leads to the following Smatch static
checker warning:

drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:285 hp_populate_enumeration_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:289 hp_populate_enumeration_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:263 hp_populate_integer_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:286 hp_populate_ordered_list_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:290 hp_populate_ordered_list_elements_from_package() error: double free of 'tmpstr'
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:291 hp_populate_ordered_list_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:371 hp_populate_password_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:252 hp_populate_string_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:256 hp_populate_string_elements_from_package() error: double free of 'str_value'

drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
    125 static int hp_populate_enumeration_elements_from_package(union acpi_object *enum_obj,
    126                                                          int enum_obj_count,
    127                                                          int instance_id)
    128 {
    129         char *str_value = NULL;

str_value starts as NULL.

    130         int value_len;
    131         u32 size = 0;
    132         u32 int_value;
    133         int elem = 0;
    134         int reqs;
    135         int pos_values;
    136         int ret;
    137         int eloc;
    138         struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
    139 
    140         for (elem = 1, eloc = 1; elem < enum_obj_count; elem++, eloc++) {
    141                 /* ONLY look at the first ENUM_ELEM_CNT elements */
    142                 if (eloc == ENUM_ELEM_CNT)
    143                         goto exit_enumeration_package;

But here we free the str_value from the previous iteration.

    144 
    145                 switch (enum_obj[elem].type) {
    146                 case ACPI_TYPE_STRING:
    147                         if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
    148                                 ret = hp_convert_hexstr_to_str(enum_obj[elem].string.pointer,
    149                                                                enum_obj[elem].string.length,
    150                                                                &str_value, &value_len);
    151                                 if (ret)
    152                                         return -EINVAL;

Here the str_value from the previos iteration is re-assigned without
being freed.  (memory leak).

    153                         }
    154                         break;
    155                 case ACPI_TYPE_INTEGER:
    156                         int_value = (u32)enum_obj[elem].integer.value;
    157                         break;
    158                 default:
    159                         pr_warn("Unsupported object type [%d]\n", enum_obj[elem].type);
    160                         continue;
    161                 }
    162 
    163                 /* Check that both expected and read object type match */
    164                 if (expected_enum_types[eloc] != enum_obj[elem].type) {
    165                         pr_err("Error expected type %d for elem %d, but got type %d instead\n",
    166                                expected_enum_types[eloc], elem, enum_obj[elem].type);
    167                         return -EIO;
    168                 }
    169 
    170                 /* Assign appropriate element value to corresponding field */
    171                 switch (eloc) {
    172                 case NAME:
    173                 case VALUE:
    174                         break;
    175                 case PATH:
    176                         strscpy(enum_data->common.path, str_value,

If str_value is NULL this will crash.

    177                                 sizeof(enum_data->common.path));
    178                         break;
    179                 case IS_READONLY:
    180                         enum_data->common.is_readonly = int_value;
    181                         break;
    182                 case DISPLAY_IN_UI:
    183                         enum_data->common.display_in_ui = int_value;
    184                         break;
    185                 case REQUIRES_PHYSICAL_PRESENCE:
    186                         enum_data->common.requires_physical_presence = int_value;
    187                         break;
    188                 case SEQUENCE:
    189                         enum_data->common.sequence = int_value;
    190                         break;
    191                 case PREREQUISITES_SIZE:
    192                         enum_data->common.prerequisites_size = int_value;
    193                         if (int_value > MAX_PREREQUISITES_SIZE)
    194                                 pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
    195 
    196                         /*
    197                          * This HACK is needed to keep the expected
    198                          * element list pointing to the right obj[elem].type
    199                          * when the size is zero. PREREQUISITES
    200                          * object is omitted by BIOS when the size is
    201                          * zero.
    202                          */
    203                         if (int_value == 0)
    204                                 eloc++;
    205                         break;
    206 
    207                 case PREREQUISITES:
    208                         size = min_t(u32, enum_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
    209                         for (reqs = 0; reqs < size; reqs++) {
    210                                 if (elem >= enum_obj_count) {
    211                                         pr_err("Error enum-objects package is too small\n");
    212                                         return -EINVAL;
    213                                 }
    214 
    215                                 ret = hp_convert_hexstr_to_str(enum_obj[elem + reqs].string.pointer,
    216                                                                enum_obj[elem + reqs].string.length,
    217                                                                &str_value, &value_len);

str_value is re-assigned again.  (memory leak).

    218 
    219                                 if (ret)
    220                                         return -EINVAL;
    221 
    222                                 strscpy(enum_data->common.prerequisites[reqs],
    223                                         str_value,
    224                                         sizeof(enum_data->common.prerequisites[reqs]));
    225 
    226                                 kfree(str_value);

str_value is freed.  (this will lead to a crash).

    227                         }
    228                         break;
    229 
    230                 case SECURITY_LEVEL:
    231                         enum_data->common.security_level = int_value;
    232                         break;
    233 
    234                 case ENUM_CURRENT_VALUE:
    235                         strscpy(enum_data->current_value,
    236                                 str_value, sizeof(enum_data->current_value));

No check for NULL.

    237                         break;
    238                 case ENUM_SIZE:
    239                         enum_data->possible_values_size = int_value;
    240                         if (int_value > MAX_VALUES_SIZE)
    241                                 pr_warn("Possible number values size value exceeded the maximum number of elements supported or data may be malformed\n");
    242 
    243                         /*
    244                          * This HACK is needed to keep the expected
    245                          * element list pointing to the right obj[elem].type
    246                          * when the size is zero. POSSIBLE_VALUES
    247                          * object is omitted by BIOS when the size is zero.
    248                          */
    249                         if (int_value == 0)
    250                                 eloc++;
    251                         break;
    252 
    253                 case ENUM_POSSIBLE_VALUES:
    254                         size = enum_data->possible_values_size;
    255 
    256                         for (pos_values = 0; pos_values < size && pos_values < MAX_VALUES_SIZE;
    257                              pos_values++) {
    258                                 if (elem >= enum_obj_count) {
    259                                         pr_err("Error enum-objects package is too small\n");
    260                                         return -EINVAL;
    261                                 }
    262 
    263                                 ret = hp_convert_hexstr_to_str(enum_obj[elem + pos_values].string.pointer,
    264                                                                enum_obj[elem + pos_values].string.length,
    265                                                                &str_value, &value_len);

Re-assigned again.

    266 
    267                                 if (ret)
    268                                         return -EINVAL;
    269 
    270                                 /*
    271                                  * ignore strings when possible values size
    272                                  * is greater than MAX_VALUES_SIZE
    273                                  */
    274                                 if (size < MAX_VALUES_SIZE)
    275                                         strscpy(enum_data->possible_values[pos_values],
    276                                                 str_value,
    277                                                 sizeof(enum_data->possible_values[pos_values]));
    278                         }
    279                         break;
    280                 default:
    281                         pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
    282                         break;
    283                 }
    284 
--> 285                 kfree(str_value);

str_value is freed at the end of every iteration so this is double free
from the PREREQUISITES code.

    286         }
    287 
    288 exit_enumeration_package:
    289         kfree(str_value);

This is a double free as well.  I don't see how this one could have been
avoided in testing???

    290         return 0;
    291 }

regards,
dan carpenter

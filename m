Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7B1C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 17:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjCARyx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 12:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjCARyp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 12:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03391A958
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677693205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IXEqTKAMT1XftavUR6rwDZHi6aWgxDB4oCF3K0jj+N8=;
        b=GRMF/SHInYMlHRlFuEfEiqJ9zA9FJxBErxEfJh0Zjv1SAZuNsp4OYjBTWmCxHAQ5XZVj1q
        a+oF2xzTOX8oy0r1fNustz4ZZ3baulpYN/wiwD+0bd8+dX2+S90xqVo1OiVh4MFkbBO6Gl
        hqg0Z6Ps4y5gH/OKmxZjo0CuTKwh2ao=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-tS91q7KKMFavXWN_-x8E2Q-1; Wed, 01 Mar 2023 12:51:28 -0500
X-MC-Unique: tS91q7KKMFavXWN_-x8E2Q-1
Received: by mail-ed1-f69.google.com with SMTP id d24-20020a056402401800b004b65da6d5e2so14667034eda.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 09:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXEqTKAMT1XftavUR6rwDZHi6aWgxDB4oCF3K0jj+N8=;
        b=ZSCyBkG/ZaMa+MPdEwX2KxZVBbgjbiRT3CNcT02Nmmqv2LwGLZsD5Z44vdc8ymiIHz
         +dl0rJyfSwCNFgqH37PWal1VxaMlIVF5ZqlMBa1sEPFn76x0WWF5HrAERS2phOlwMzgB
         wJ4eyS01LQ+y6Mrs78u+9UzVksljvyIjoSimBDKDil6+qhGcGC3E24UVWnsDbV3aM1RZ
         2eBgFe/RnUgaKzK9SRzQNmcxHlvb1EDybg349fJPdRMTsSix6/+J6zjy9FIWhsJHlfWM
         uFPOn0UZ+EYKcHSvItnreX+OMEl8bhq4BDWjQ0fGhSRZVYJzAwdjGaiymVCWixOnPzkp
         GzVA==
X-Gm-Message-State: AO0yUKWt3zgz6z3847Wl/RS3tUPtGtGXg+/ogmACHgDlFF+/HgLRmkQo
        KBXg19hDQ92m1Ty4sQ0PqAxtC7RozFItsFb3b1vA+kblA8F05fsHRUNVOUnPIgAfRCso+Jqjb85
        aEBE24/1YOAZMVZzHOS0IT7u1qMVUhXtB2xdSQAs=
X-Received: by 2002:aa7:c3c2:0:b0:4ac:bdf7:1c3f with SMTP id l2-20020aa7c3c2000000b004acbdf71c3fmr6971931edr.29.1677693051922;
        Wed, 01 Mar 2023 09:50:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/xieR4URDZzUhBNsztORgX1Fn25bOfSrUxUfUw24sTfdGIzEB2feA/ae7DqEk4HLWh060Bpw==
X-Received: by 2002:aa7:c3c2:0:b0:4ac:bdf7:1c3f with SMTP id l2-20020aa7c3c2000000b004acbdf71c3fmr6971912edr.29.1677693051566;
        Wed, 01 Mar 2023 09:50:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b008cd1f773754sm5999081ejg.5.2023.03.01.09.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:50:50 -0800 (PST)
Message-ID: <222e94e6-2ddb-a612-31b1-4537141ef478@redhat.com>
Date:   Wed, 1 Mar 2023 18:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
Content-Language: en-US, nl
To:     Nikita Kravets <teackot@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230214132522.32631-1-teackot@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230214132522.32631-1-teackot@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/14/23 14:25, Nikita Kravets wrote:
> Add a new driver to allow various MSI laptops' functionalities to be
> controlled from userspace. This includes such features as power
> profiles (aka shift modes), fan speed, charge thresholds, LEDs, etc.
> 
> This driver contains EC memory configurations for different firmware
> versions and exports battery charge thresholds to userspace (note,
> that start and end thresholds control the same EC parameter
> and are always 10% apart).
> 
> Link: https://github.com/BeardOverflow/msi-ec/
> Discussion: https://github.com/BeardOverflow/msi-ec/pull/13
> Signed-off-by: Nikita Kravets <teackot@gmail.com>

Thanks overall this looks pretty good.

Please address the review-remarks from Barnabás.

I also have 2 small remarks myself:

1. See the remark inline below.

2. I ran checkpatch on the patch and it found several issues,
   I'll copy and paste the output to the end of this email,
   please address these issues.

   And if possible run scripts/checkpatch.pl yourself to
   verify the issues are fixed.


> ---
>  drivers/platform/x86/Kconfig  |   7 +
>  drivers/platform/x86/Makefile |   1 +
>  drivers/platform/x86/msi-ec.c | 528 ++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/msi-ec.h | 119 ++++++++
>  4 files changed, 655 insertions(+)
>  create mode 100644 drivers/platform/x86/msi-ec.c
>  create mode 100644 drivers/platform/x86/msi-ec.h

<snip>

> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> new file mode 100644
> index 000000000000..b32106445bf6
> --- /dev/null
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -0,0 +1,528 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/*
> + * msi-ec: MSI laptops' embedded controller driver.
> + *
> + * This driver allows various MSI laptops' functionalities to be
> + * controlled from userspace.
> + *
> + * It contains EC memory configurations for different firmware versions
> + * and exports battery charge thresholds to userspace.
> + *
> + * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
> + * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
> + * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
> + */
> +

Since you are using pr_info() / pr_err() please add:

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

This will automatically prefix all pr_*() calls with

"msi-ec: "

<snip>

> +	pr_err("Your firmware version is not supported!\n");

So this will then now get automatically prefixed.

> +	return -EOPNOTSUPP;
> +}
> +
> +static int __init msi_ec_init(void)
> +{
> +	int result;
> +
> +	if (acpi_disabled) {
> +		pr_err("Unable to init because ACPI needs to be enabled first!\n");

And this too.


> +		return -ENODEV;
> +	}
> +
> +	result = load_configuration();
> +	if (result < 0)
> +		return result;
> +
> +	battery_hook_register(&battery_hook);
> +
> +	pr_info("msi-ec: module_init\n");

And you can drop the manual "msi-ec: " prefixing here then.

> +	return 0;
> +}
> +
> +static void __exit msi_ec_exit(void)
> +{
> +	battery_hook_unregister(&battery_hook);
> +
> +	pr_info("msi-ec: module_exit\n");

And drop it here too.

Regards,

Hans


[hans@shalem platform-drivers-x86]$ git format-patch HEAD~
0001-platform-x86-Add-new-msi-ec-driver.patch
[hans@shalem platform-drivers-x86]$ scripts/checkpatch.pl 0001-platform-x86-Add-new-msi-ec-driver.patch
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

WARNING: Improper SPDX comment style for 'drivers/platform/x86/msi-ec.c', please use '//' instead
#65: FILE: drivers/platform/x86/msi-ec.c:1:
+/* SPDX-License-Identifier: GPL-2.0-or-later */

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#65: FILE: drivers/platform/x86/msi-ec.c:1:
+/* SPDX-License-Identifier: GPL-2.0-or-later */

ERROR: Use of const init definition must use __initconst
#97: FILE: drivers/platform/x86/msi-ec.c:33:
+static const char *ALLOWED_FW_0[] __initdata = {

ERROR: Use of const init definition must use __initconst
#167: FILE: drivers/platform/x86/msi-ec.c:103:
+static const char *ALLOWED_FW_1[] __initdata = {

ERROR: Use of const init definition must use __initconst
#238: FILE: drivers/platform/x86/msi-ec.c:174:
+static const char *ALLOWED_FW_2[] __initdata = {

ERROR: Use of const init definition must use __initconst
#310: FILE: drivers/platform/x86/msi-ec.c:246:
+static const char *ALLOWED_FW_3[] __initdata = {

WARNING: Missing a blank line after declarations
#401: FILE: drivers/platform/x86/msi-ec.c:337:
+	u8 i;
+	for (i = 0; i < len; i++) {

WARNING: Missing a blank line after declarations
#539: FILE: drivers/platform/x86/msi-ec.c:475:
+	u8 fw_version[MSI_EC_FW_VERSION_LENGTH + 1];
+	result = ec_get_firmware_version(fw_version);

WARNING: braces {} are not necessary for single statement blocks
#540: FILE: drivers/platform/x86/msi-ec.c:476:
+	if (result < 0) {
+		return result;
+	}

total: 4 errors, 6 warnings, 667 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

0001-platform-x86-Add-new-msi-ec-driver.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.






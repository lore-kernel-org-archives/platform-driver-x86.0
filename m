Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90519C07E9C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 13:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76D2C613B6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 13:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhGNNK5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Jul 2021 09:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42085 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231445AbhGNNK5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jul 2021 09:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626268085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pyteJOSXldKeW2B8OhoW61tlSJXkUkJzZ0uvDE6lWGA=;
        b=KZyAKubNyaXhx6tGII5LXe49SA2vUsBpiCd/QqC90UeZI1yySrrVUeEqxWcGoMfS5ItebM
        qCL9uvnZfl0n9AL00caUwl/UUTvNoEgcEOxMytXLRkpn/hWcFO3LYHBdXGtYOPdZQ6ZBnf
        utAyQkrWvfaEnN34Mrv21jSGrn2shnM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-o4tOUzhDPg6TuGspIwx8ew-1; Wed, 14 Jul 2021 09:08:03 -0400
X-MC-Unique: o4tOUzhDPg6TuGspIwx8ew-1
Received: by mail-ej1-f70.google.com with SMTP id e23-20020a1709062497b0290504bafdd58dso770198ejb.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jul 2021 06:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pyteJOSXldKeW2B8OhoW61tlSJXkUkJzZ0uvDE6lWGA=;
        b=VMV2fZ9l2otIgFGmN5SDbnB7P9TAsuOSpazKtgc3nKH2rkSTbgXjvJ6A1A14pluPuW
         nIuMXfR1eoq82Lj9JDnbKZGjsbAQAyb9l7s4yakiaINBlP0s5qCuiDY2wIFdfm1IIcXt
         5079/rdrLRivZs/9jVe50dmvx5fkt8+pkOv3yHMd7t7RvqzmV4eCmjcfAa6neq6dyQQj
         GDLD/C0AI2NzwbQW3IZUr5Oo1QlspAuMpx16EBOTxMO38OVX5+LM7yFSLL6wikWFhZcY
         8Z7XjFN4emr39DzksR1tajoHFP0kEtL//HBx2DUwBJVYm2A7AKXSzOKrpyx/VD6G3YEI
         VYwg==
X-Gm-Message-State: AOAM533+bhiWIDnCSw+SaUlfacO+PQ+zDojrzklfNaOKseWgC/hqpwqm
        hCdO6sW6niBdRPu6LzvynHNfCNAeYY3mGqz3/f1R5pxZm/ZnVGdazAgr6MPbQQA0jB165wXF/Tc
        0qQG+763r943+hD5AjjK4WljbhuQftNO+5A==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr12122682ejc.264.1626268082546;
        Wed, 14 Jul 2021 06:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe0MFBjkSOhI/EUiXOpAo7imRUXLvEToTypwztU43v6O+0csaEX31alKYJ1ZmznVVx6zMf1g==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr12122663ejc.264.1626268082305;
        Wed, 14 Jul 2021 06:08:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s24sm606203ejd.19.2021.07.14.06.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 06:08:01 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: think-lmi: Add pending_reboot support
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        mario.limonciello@amd.com
References: <markpearson@lenovo.com>
 <20210628222846.8830-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c719e248-8a77-7a84-dda1-87104218d938@redhat.com>
Date:   Wed, 14 Jul 2021 15:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628222846.8830-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/29/21 12:28 AM, Mark Pearson wrote:
> The Think-lmi driver was missing pending_reboot support as it wasn't
> available from the BIOS. Turns out this is really useful to have from
> user space so implementing from a purely SW point of view.
> 
> Thanks to Mario Limonciello for guidance on how fwupd would use this.
> 
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also apply this to the fixes branch and include it in my
upcoming v5.14 pdx86 fixes pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
> Changes in v2: 
>   - added in Mario's Suggested-by tag (and will use correct email when
>     submitting patch)
> 
>  drivers/platform/x86/think-lmi.c | 19 +++++++++++++++++++
>  drivers/platform/x86/think-lmi.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index b57061079..bcc3d6fcd 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -566,6 +566,11 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	else
>  		ret = tlmi_save_bios_settings("");
>  
> +	if (!ret && !tlmi_priv.pending_changes) {
> +		tlmi_priv.pending_changes = true;
> +		/* let userland know it may need to check reboot pending again */
> +		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
> +	}
>  out:
>  	kfree(auth_str);
>  	kfree(set_str);
> @@ -641,6 +646,14 @@ static struct kobj_type tlmi_pwd_setting_ktype = {
>  	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
>  };
>  
> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
> +}
> +
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
>  /* ---- Initialisation --------------------------------------------------------- */
>  static void tlmi_release_attr(void)
>  {
> @@ -662,6 +675,7 @@ static void tlmi_release_attr(void)
>  	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
>  	kobject_put(&tlmi_priv.pwd_power->kobj);
>  	kset_unregister(tlmi_priv.authentication_kset);
> +	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
>  }
>  
>  static int tlmi_sysfs_init(void)
> @@ -730,6 +744,11 @@ static int tlmi_sysfs_init(void)
>  	if (ret)
>  		goto fail_create_attr;
>  
> +	/* Create global sysfs files */
> +	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
> +	if (ret)
> +		goto fail_create_attr;
> +
>  	return ret;
>  
>  fail_create_attr:
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 6fa8da7af..eb5988466 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -60,6 +60,7 @@ struct think_lmi {
>  	bool can_get_bios_selections;
>  	bool can_set_bios_password;
>  	bool can_get_password_settings;
> +	bool pending_changes;
>  
>  	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
>  	struct device *class_dev;
> 


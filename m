Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8652DC32796
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 13:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbiHXNxb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236752AbiHXNxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 09:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE219A69A
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661348908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LFKXqMG4VFY8N43lcxl/QEa2/Uc7ZlixUR+Yz8ZUHY8=;
        b=AcyvmXCqB+Ln+KCvbhO29eBNEyAA4VKJrPnK4XOV3lJ/ZCEXkuw8AuUtU+8B83AMeT2SzQ
        M5Mg13V9UmN4u+5Y5tn643lcuRGZzqOskiccmmURwXB/6DO0a61yyId3XUrm4zkfL4SV99
        quFNyW5M02N+ImCqwyHcleVB2WiF78o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-fORHeNy6P76FxBhbvbMWpw-1; Wed, 24 Aug 2022 09:48:27 -0400
X-MC-Unique: fORHeNy6P76FxBhbvbMWpw-1
Received: by mail-ej1-f72.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso5177065ejc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 06:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LFKXqMG4VFY8N43lcxl/QEa2/Uc7ZlixUR+Yz8ZUHY8=;
        b=d8Us4PM2YBqTyFUjp5LRYE/IuXeRMdP3xFbDOGG30zbWexxRp/tYtpOqRsIXV6ypW0
         Orth8H/KHT4r8uguMpLy94YECX/49yAg68FWijzVEqSUn5Z00RC2CG5dzDRdRKvGM2Tr
         4DaNHZHrYisNOzhZDwgbb0aNgszpBRd5YS0f+qpNUp2b4cu5VBmbPwL7lrrGOS8ypGf+
         gng95lTAl+VHD4eWIYjtMBai8fE6SSTTswJZ3QUUA7NrDvm0/f/WW9GgKxEQt0c9PqSa
         eCzbJmcC0VDz/L6eDxzuDoCnRiPgQdtMoVMNnfszu0qDbHIRhW5XaLezkCJKF9eG2kbA
         KVxg==
X-Gm-Message-State: ACgBeo3+WR825hgm97VXTTGHBsQFccbcJBlMLA+C9KYOmC0lCkXKh5D8
        yamEQmICXCOVlNH/8yEYvH9RM5yxfWOTk7DR3gy/5WcghLaKZKRttbbMJMaTr3k3X+AhPYSndnY
        YJHjkhTLLiYzE8A/dzBYAsYiVunHgFOrxJQ==
X-Received: by 2002:a17:907:7e8a:b0:732:ff29:d1d6 with SMTP id qb10-20020a1709077e8a00b00732ff29d1d6mr3071109ejc.175.1661348905912;
        Wed, 24 Aug 2022 06:48:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4CLWPQboBWp4u1HuneIoHpGycev64zEi8mhFG1KVx518+xNnrQpMfi1aZWFdBoUzKoNXn5XQ==
X-Received: by 2002:a17:907:7e8a:b0:732:ff29:d1d6 with SMTP id qb10-20020a1709077e8a00b00732ff29d1d6mr3071095ejc.175.1661348905707;
        Wed, 24 Aug 2022 06:48:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id gy18-20020a170906f25200b0073c37199b86sm1189401ejb.159.2022.08.24.06.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:48:25 -0700 (PDT)
Message-ID: <60d4fc34-78e6-c5c8-483c-f64dbc02926f@redhat.com>
Date:   Wed, 24 Aug 2022 15:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Simplify some of the
 *_check_present() helpers
Content-Language: en-US
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
References: <20220815150538.474306-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220815150538.474306-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/15/22 17:05, Hans de Goede wrote:
> After the recent cleanup patches, some of the *_check_present() helpers
> just propagate the result of asus_wmi_dev_is_present().
> 
> Replace these with direct asus_wmi_dev_is_present() calls as a further
> cleanup.
> 
> Cc: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-wmi.c | 47 +++------------------------------
>  1 file changed, 3 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 2d9d709aa59f..d72491fb218b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -557,16 +557,6 @@ static void lid_flip_tablet_mode_get_state(struct asus_wmi *asus)
>  }
>  
>  /* dGPU ********************************************************************/
> -static int dgpu_disable_check_present(struct asus_wmi *asus)
> -{
> -	asus->dgpu_disable_available = false;
> -
> -	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU))
> -		asus->dgpu_disable_available = true;
> -
> -	return 0;
> -}
> -
>  static ssize_t dgpu_disable_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -620,16 +610,6 @@ static ssize_t dgpu_disable_store(struct device *dev,
>  static DEVICE_ATTR_RW(dgpu_disable);
>  
>  /* eGPU ********************************************************************/
> -static int egpu_enable_check_present(struct asus_wmi *asus)
> -{
> -	asus->egpu_enable_available = false;
> -
> -	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU))
> -		asus->egpu_enable_available = true;
> -
> -	return 0;
> -}
> -
>  static ssize_t egpu_enable_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -1497,16 +1477,6 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
>  }
>  
>  /* Panel Overdrive ************************************************************/
> -static int panel_od_check_present(struct asus_wmi *asus)
> -{
> -	asus->panel_overdrive_available = false;
> -
> -	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD))
> -		asus->panel_overdrive_available = true;
> -
> -	return 0;
> -}
> -
>  static ssize_t panel_od_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -3493,13 +3463,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform;
>  
> -	err = egpu_enable_check_present(asus);
> -	if (err)
> -		goto fail_egpu_enable;
> -
> -	err = dgpu_disable_check_present(asus);
> -	if (err)
> -		goto fail_dgpu_disable;
> +	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
> +	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
> +	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
>  
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
> @@ -3515,10 +3481,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform_profile_setup;
>  
> -	err = panel_od_check_present(asus);
> -	if (err)
> -		goto fail_panel_od;
> -
>  	err = asus_wmi_sysfs_init(asus->platform_device);
>  	if (err)
>  		goto fail_sysfs;
> @@ -3613,10 +3575,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (asus->platform_profile_support)
>  		platform_profile_remove();
>  fail_fan_boost_mode:
> -fail_egpu_enable:
> -fail_dgpu_disable:
>  fail_platform:
> -fail_panel_od:
>  	kfree(asus);
>  	return err;
>  }


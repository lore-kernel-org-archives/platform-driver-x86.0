Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1CAC4320A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 193D06108D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbhHRHqh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20522 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239959AbhHRHqP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 03:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629272741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F+IPI7fH7JimWy1VkqrSd45ZcybbOntV4Dvzf6QmLYU=;
        b=ZVMyR/NKgEh1BFUlEmKqLCMzr6OYen1vJ018OzhWGP7zW06uHhDWdgK1b0J2LSDyMUkxN0
        h+MxBdFbq2WkYOUhdaxowmot8sIx7dVc+EHg9Z5oA5AdmyrExYICx4NCtp2EEUa9yULV10
        jzl6VTXWAjdNsmU0g16gJLtHQHvTQKk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-5Kz_fqXlMN2m7JV7zKY0VA-1; Wed, 18 Aug 2021 03:44:59 -0400
X-MC-Unique: 5Kz_fqXlMN2m7JV7zKY0VA-1
Received: by mail-ed1-f70.google.com with SMTP id j15-20020aa7c40f0000b02903be5fbe68a9so609530edq.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 00:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F+IPI7fH7JimWy1VkqrSd45ZcybbOntV4Dvzf6QmLYU=;
        b=E414UiiUhALMVGRnINi6rEk0ImD1QWXQskSIW5WnKIEO4aksarFKCWf26J4LZufKgC
         gu4H1fS4P1etr5uw5m2PLly0E8X65pyJy+Cb/XSYdnQANqYDvkIAJymhpQMp9BAgAN9m
         b1Nb1UlIVBIDhQPRTHWj8y5d7fh/ci7fusuZFPI6BnjDTohZxUIQubhLw3oPT37gL9fy
         zOwDyJXl5fLl7YYAeBCmtOnNn/WgVmGIhRutN7q/SnCwtqJtddxZSRVC9wxy2y70gAjA
         6vw0WdSMEUqVju0pwl7/nPYLAN+qzn929Y1qG9Sf6lpEGneO7CoPS+I/BgUe0oEaLZcx
         M3lQ==
X-Gm-Message-State: AOAM533T5vHLlluUxigc7Y4IBwTvOF1lCrcvaaKe+Ola7tmfZSmf6KbM
        mCBpWxLQGMpDmmkCP6yg4L0Lrk1hpzjvIHdGdjZIkHRrEFr0YTYB5btWWJVGNwwrIjCSOBUcfKS
        jVY7U3g6IxjX+MhimREjx1b7nD+M/UmiiVr7TNHs8VTnJS8y1bGQBiaxZ+JSZ9vvJ/dBr/Hrp17
        LMvOYNHqSTdQ==
X-Received: by 2002:a05:6402:1c03:: with SMTP id ck3mr8740637edb.312.1629272698380;
        Wed, 18 Aug 2021 00:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK3azjfCrpMlDDbS5/Ni6i0N/GnE5kkVkqOISzcRLX3C8eQI5JkB4pBMXXGZw43fzfVUz/QQ==
X-Received: by 2002:a05:6402:1c03:: with SMTP id ck3mr8740625edb.312.1629272698234;
        Wed, 18 Aug 2021 00:44:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c21sm1650928ejz.69.2021.08.18.00.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:44:57 -0700 (PDT)
Subject: Re: [PATCH] ideapad-laptop: Fix Legion 5 Fn lock LED
To:     Meng Dong <whenov@gmail.com>, Ike Panhc <ike.pan@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210817171203.12855-1-whenov@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b5905cfc-db0e-72ff-745a-3439333f35b0@redhat.com>
Date:   Wed, 18 Aug 2021 09:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817171203.12855-1-whenov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/17/21 7:12 PM, Meng Dong wrote:
> This patch fixes the bug 212671.
> Althrough the Fn lock (Fn + Esc) works on Legion 5 (R7000P), its LED
> light does not change with the state. This modification sets the Fn lock
> state to its current value on receiving the wmi event
> 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 to update the LED state.
> 
> Signed-off-by: Meng Dong <whenov@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> Another possible approach is to call `ideapad_input_report(priv, value)`
> to send a keycode and let the user handle the LED by echoing the current
> value of /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fn_lock back
> into itself. But the problem with this approach is Fn+F9 and Fn+Esc
> trigger the same WMI GUID and event value and I have no idea how to
> distinguish them.
> 
>  drivers/platform/x86/ideapad-laptop.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 784326bd72f0..48561b666547 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -41,6 +41,7 @@
>  static const char *const ideapad_wmi_fnesc_events[] = {
>  	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
>  	"56322276-8493-4CE8-A783-98C991274F5E", /* Yoga 700 */
> +	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", /* Legion 5 */
>  };
>  #endif
>  
> @@ -1464,6 +1465,15 @@ static void ideapad_wmi_notify(u32 value, void *context)
>  	case 128:
>  		ideapad_input_report(priv, value);
>  		break;
> +	case 208:
> +		unsigned long result;
> +
> +		if (!eval_hals(priv->adev->handle, &result)) {
> +			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
> +
> +			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> +		}
> +		break;
>  	default:
>  		dev_info(&priv->platform_device->dev,
>  			 "Unknown WMI event: %u\n", value);
> 


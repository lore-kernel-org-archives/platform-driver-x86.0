Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2146FC7EE29
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 May 2023 10:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjE3KzP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 May 2023 06:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjE3KzL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2023 06:55:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D10893
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685444069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1q0i4yZqdxDmT+xuTpGSHTNOPsQSPD0T9mC8x9n9pmQ=;
        b=VxeNEVTSI7yS2hefjHpxBmx88WpmIBZtJUw+X+l4UEicjXpghuwK0eLH+2aZgHl26jJCqq
        Ej8cSNBtdb+aWzHu8zL40ZjFP4TUWszNPVTrCeibXD2VbV1i1sTI2YsQf4fcJdwbFEsl+N
        GZh+tKp6H1O5mXx1fa6O8bW0NdwSzRA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-q8fXmQHZMjasUq4TKYeeBg-1; Tue, 30 May 2023 06:54:28 -0400
X-MC-Unique: q8fXmQHZMjasUq4TKYeeBg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-514b05895f7so592328a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 03:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444067; x=1688036067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1q0i4yZqdxDmT+xuTpGSHTNOPsQSPD0T9mC8x9n9pmQ=;
        b=SCKiSBgxRSYAyI0SHiyqUp3Rk0XbFHiswZS1Nfsv3XHclg9OPa8dUKO3nW/Ia6WUO8
         hQIKKdaTEG+Fu211DbfG7NkPEcyXzggQk9oPF1FZbzjmFmzenVz1oGjA3WCl3oY4aN58
         eP+s8+j7E4zu9YntFZ9P4ZtQ1iQQKEu81E8xeWzCF3CUrPqDDO7vpyUvbzoCESxD6Afx
         Bu+4OmyAK4JvxWCLzfuUGQ7F51PRqk7xA+eYnnq5nI+LkvD4hFvbs3QtX4Y9yh/3c5q7
         ve73v6EhGEW8u9hAmVdH7tPSI8hUBiySLAOtVOOibb6lV748rbiEDA1vvhI06Fvrk8SW
         0eQg==
X-Gm-Message-State: AC+VfDxydRyp3epmQJra0pP3obvGa29OpIpcdEp7ur+Hmm1TYbPSI7Gm
        Ki/aK2o5VzC1rIeFDFj1tuNT68DsZ1u+L86ZAPVfEjYUuQ1aNPOf6IqTkWSEVnASp455GHmIUsd
        2/nmgnN+lGHqn/q6VUfb8lL3EeDHlTF+hhA==
X-Received: by 2002:aa7:d658:0:b0:514:9e81:906f with SMTP id v24-20020aa7d658000000b005149e81906fmr1305859edr.27.1685444066906;
        Tue, 30 May 2023 03:54:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4I+096SwjLja4pHY4YqUYfGIPnsw0Zn+UHnBRONfv/VtPgD+leGxP0osXxo4zOb0YFNGuQaQ==
X-Received: by 2002:aa7:d658:0:b0:514:9e81:906f with SMTP id v24-20020aa7d658000000b005149e81906fmr1305844edr.27.1685444066550;
        Tue, 30 May 2023 03:54:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n2-20020aa7d042000000b00514b044ec41sm693137edo.35.2023.05.30.03.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:54:26 -0700 (PDT)
Message-ID: <2ca9ef5d-2a24-c6b7-06fc-5b9919a2aaee@redhat.com>
Date:   Tue, 30 May 2023 12:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/5] platform/x86: think-lmi: Enable opcode support on
 BIOS settings
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230526171658.3886-1-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230526171658.3886-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 5/26/23 19:16, Mark Pearson wrote:
> Whilst reviewing some documentation from the FW team on using WMI on
> Lenovo system I noticed that we weren't using Opcode support when
> changing BIOS settings in the thinkLMI driver.
> 
> We should be doing this to ensure we're future proof as the old
> non-opcode mechanism has been deprecated.
> 
> Tested on X1 Carbon G10 and G11.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thank you for this new version. Please prepare a v4 addressing Ilpo's
review remarks.

About the aligning function arguments on the next line to the '('
of the function call start at the previous line, checkpatch also
checks for this.

It is always a good idea to run checkpatch before submitting patches.

E.g.:

git format-patch -v3 HEAD~5
scripts/checkpatch.pl v3-00*.patch
<check output is clean>
git send-email v3-00*.patch

Regards,

Hans





> ---
> Changes in v2: Update comment for clearer explanation of what the driver
> is doing
> Changes in v3: None. Version bump with rest of series
> 
>  drivers/platform/x86/think-lmi.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 1138f770149d..2745224f62ab 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1001,7 +1001,33 @@ static ssize_t current_value_store(struct kobject *kobj,
>  				tlmi_priv.pwd_admin->save_signature);
>  		if (ret)
>  			goto out;
> -	} else { /* Non certiifcate based authentication */
> +	} else if (tlmi_priv.opcode_support) {
> +		/*
> +		 * If opcode support is present use that interface.
> +		 * Note - this sets the variable and then the password as separate
> +		 * WMI calls. Function tlmi_save_bios_settings will error if the
> +		 * password is incorrect.
> +		 */
> +		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
> +					new_setting);
> +		if (!set_str) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +
> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> +		if (ret)
> +			goto out;
> +
> +		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> +			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
> +					tlmi_priv.pwd_admin->password);
> +			if (ret)
> +				goto out;
> +		}
> +
> +		ret = tlmi_save_bios_settings("");
> +	} else { /* old non opcode based authentication method (deprecated)*/
>  		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>  					tlmi_priv.pwd_admin->password,


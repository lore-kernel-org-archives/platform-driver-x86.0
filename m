Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF31C64E75
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 10:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA60520B80
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 10:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kd6JjWNu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388180AbgKZKp7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Nov 2020 05:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29649 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbgKZKp6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Nov 2020 05:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606387556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XMFsV6J4cYnv0icJ5WDcZXl06565syo1zevHWnWoHSI=;
        b=Kd6JjWNuyeuuARjxLJpk1UNxFViXkC8AvnaZ/ZS2f47wuW+8zPEqQu5WtXZbyg22vFcCLc
        b1q06JnCZd2kusz0W5R1BoJQCxYuuJwUQ3cWlLzkkvafJykr2lSdU7p6NrtY6ZU9aDzfd9
        qVdUOzAbdyrVxKs7Z4GmNcBXPY0r1rQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-1hEhsLm0PKeLCwwaGx9uIg-1; Thu, 26 Nov 2020 05:45:54 -0500
X-MC-Unique: 1hEhsLm0PKeLCwwaGx9uIg-1
Received: by mail-ed1-f69.google.com with SMTP id o11so884264edq.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2020 02:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XMFsV6J4cYnv0icJ5WDcZXl06565syo1zevHWnWoHSI=;
        b=criYWa2t+EUzlwVL7sne0de3Uj6lGu7nreQjhmOo1FBBJgrKxVLB/8vmHFBVqomjkV
         gWC3QeCwI/sVIijVs2VdWBTUjDvLN3MGmYyONkwe1goprRGsB7D7x7ra07W50NDy5/En
         iEbT/NSG4TCk5MN2rMWDgmjE79OJ7YHgHS21uXbFBbjw/ComMZxPnMgvqixu1P7alF+x
         UbQgU5ypfQzOyXa3eCsFfwqW065uJh2Z9v3qonqkHcLtAD5nRkOwfCXKh33MdVB65x6E
         7hNvWORRyiOJKv3t1sokOx6TAHw6SjGzDNuyPB5lS/ZzEvBZjXrklnwhrZ3N1AibI7ee
         W/LQ==
X-Gm-Message-State: AOAM533bTBfiIRCqyPo/hveyu+ML8bwl2MxxijdiAZsxTIJcr5NgvkUL
        csWdh74Tyfa1Yc/tf2wa8DcADvZBd6X1bP3e2zNOY3QrZC9CxYMVRaZe6hM6/gKK9z2b0LRM0D/
        AeRKaOFRpwhX9erE7hFVvTYS8GB8zJQDf/iAUYwJX0gRhDPE5IVFD4PzeAb/iLJAwBSFTyxJI1K
        padBX8cT2Xuw==
X-Received: by 2002:a17:906:4c82:: with SMTP id q2mr1986970eju.285.1606387553038;
        Thu, 26 Nov 2020 02:45:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH8NOeignej3q+i+UEpdi3N/tpkCIRdvzf1FEQPgvSmaiPQtiOA1QaUEJPPdzLJRVRe2qmwA==
X-Received: by 2002:a17:906:4c82:: with SMTP id q2mr1986939eju.285.1606387552837;
        Thu, 26 Nov 2020 02:45:52 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id w16sm2875826eds.81.2020.11.26.02.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 02:45:52 -0800 (PST)
Subject: Re: [PATCH 4/5] x86/platform/uv: Add deprecated messages to /proc
 info leaves
To:     Mike Travis <mike.travis@hpe.com>,
        Justin Ernst <justin.ernst@hpe.com>,
        Mark Gross <mgross@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>
Cc:     Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20201125172907.240996-1-mike.travis@hpe.com>
 <20201125172907.240996-5-mike.travis@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b0339696-049a-e46e-bcd4-079f1b13d725@redhat.com>
Date:   Thu, 26 Nov 2020 11:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125172907.240996-5-mike.travis@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/20 6:29 PM, Mike Travis wrote:
> Add "deprecated" message to any access to old /proc/sgi_uv/* leaves.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
> ---
>  arch/x86/kernel/apic/x2apic_uv_x.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
> index 48746031b39a..bfd77a00c2a1 100644
> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
> @@ -1615,21 +1615,45 @@ static void check_efi_reboot(void)
>  		reboot_type = BOOT_ACPI;
>  }
>  
> -/* Setup user proc fs files */
> +/*
> + * User proc fs file handling now deprecated.
> + * Recommend using /sys/firmware/sgi_uv/... instead.
> + */
> +static void proc_print_msg(int *flag, char *what, char *which)
> +{
> +	if (*flag)
> +		return;
> +
> +	pr_notice(
> +		"%s: using deprecated /proc/sgi_uv/%s, use /sys/firmware/sgi_uv/%s\n",
> +		current->comm, what, which ? which : what);
> +
> +	*flag = 1;
> +}
> +

You have just re-invented pr_notice_once, please just use pr_notice_once
directly in the _show functions.

Regards,

Hans




>  static int __maybe_unused proc_hubbed_show(struct seq_file *file, void *data)
>  {
> +	static int flag;
> +
> +	proc_print_msg(&flag, "hubbed", "hub_type");
>  	seq_printf(file, "0x%x\n", uv_hubbed_system);
>  	return 0;
>  }
>  
>  static int __maybe_unused proc_hubless_show(struct seq_file *file, void *data)
>  {
> +	static int flag;
> +
> +	proc_print_msg(&flag, "hubless", NULL);
>  	seq_printf(file, "0x%x\n", uv_hubless_system);
>  	return 0;
>  }
>  
>  static int __maybe_unused proc_archtype_show(struct seq_file *file, void *data)
>  {
> +	static int flag;
> +
> +	proc_print_msg(&flag, "archtype", NULL);
>  	seq_printf(file, "%s/%s\n", uv_archtype, oem_table_id);
>  	return 0;
>  }
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A1CC6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 14:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjCAOYj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 09:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjCAOYi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 09:24:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1558636459
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 06:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677680615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LkimFynSnxK6YsAaiTKJQJFBKhhOmj+Wb4G+OWeGENQ=;
        b=RU2gX3F+qDTH9lsmmUiswS64vz9n/DIU07Orq6kiXsMftXRY4nRr/wEx9p3JrytcjJPXXs
        Tkxe85mrRmzEWzVIomZQYKSXS7XZJGPXD3XgAhCjcYYMVqIG8JchzYIJE1e6pGvSm1GqAg
        9hSHVsFq5lria9hYEuvJg4Peup1pvmc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-guGzPqNQN5uVrR9HJcY2Xg-1; Wed, 01 Mar 2023 09:23:34 -0500
X-MC-Unique: guGzPqNQN5uVrR9HJcY2Xg-1
Received: by mail-ed1-f71.google.com with SMTP id d24-20020a056402401800b004b65da6d5e2so13785663eda.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 06:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkimFynSnxK6YsAaiTKJQJFBKhhOmj+Wb4G+OWeGENQ=;
        b=TDD8yJFm25ukuLrSuSEdyME3Fsc/QLiYEn6L9ffxlFL+w/zZ2/B+BnBe5Hl/O/JKhn
         sSFzY4/WYdOqBYRljdi9um5uTmj+45M9knjm1TYZmrluXvvZfdtLOqECy16L8T1oht0x
         EnyumHWBr7AnhTj+FssCk7GoSCn/q2lJ9e8hdSVJB2Iu1mapPDwKKQ3GnTTe1A7R8yZM
         57J0RQ+a+qMp1/zkLV62/EOjJgtE76L3TDElY+hRWfZfY2o67+MKZzcC9zg2pvOVQXs9
         RTFjZ3pI6Ja8gQtvcyNNr1IZTgZfRuj65tWaLCQapQGjKlMAsSG5wrF4GzuRWwtsVnbB
         iRzg==
X-Gm-Message-State: AO0yUKXGD7hI1raexiaKtLrm6vbQSP5yvz/e7CTjjdjJIUtZT/Vz6aHs
        1tzWGbTcI/c0nDIezP3WhU36OMO0hXiLqU7+qkkSJJO5e+U9L9EGCXulTydiPq6DX2sNBgANEtT
        qV+s53u/chJzh8apAmS5Ku9/FHuQuDoPWdw==
X-Received: by 2002:a17:907:b682:b0:8dc:cfe8:da53 with SMTP id vm2-20020a170907b68200b008dccfe8da53mr8667801ejc.10.1677680613078;
        Wed, 01 Mar 2023 06:23:33 -0800 (PST)
X-Google-Smtp-Source: AK7set89iR0qASUFFJ53En29c14nxWvTRDWTIt+BGVnixoWXFvL1LfSTHymUQ2K2OKvzj/ced7v/3Q==
X-Received: by 2002:a17:907:b682:b0:8dc:cfe8:da53 with SMTP id vm2-20020a170907b68200b008dccfe8da53mr8667781ejc.10.1677680612818;
        Wed, 01 Mar 2023 06:23:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t8-20020a170906178800b008dcf89a72d7sm5966994eje.147.2023.03.01.06.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 06:23:32 -0800 (PST)
Message-ID: <39b98cb1-1ef5-dabf-5f01-2f673b2b59b1@redhat.com>
Date:   Wed, 1 Mar 2023 15:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/12] platform/x86: ISST: Fix kernel documentation
 warnings
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
 <20230211063257.311746-2-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230211063257.311746-2-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/23 07:32, Srinivas Pandruvada wrote:
> Fix warning displayed for "make W=1" for kernel documentation.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks, I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll rebase that branch once 6.3-rc1 is out and then push the rebased
patch to the fixes branch and include it in my next 6.3 fixes pull-req
to Linus.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 3 ++-
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index a7e02b24a87a..63d49fe17a16 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -112,6 +112,7 @@ static void isst_delete_hash(void)
>   * isst_store_cmd() - Store command to a hash table
>   * @cmd: Mailbox command.
>   * @sub_cmd: Mailbox sub-command or MSR id.
> + * @cpu: Target CPU for the command
>   * @mbox_cmd_type: Mailbox or MSR command.
>   * @param: Mailbox parameter.
>   * @data: Mailbox request data or MSR data.
> @@ -363,7 +364,7 @@ static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn
>  /**
>   * isst_if_get_pci_dev() - Get the PCI device instance for a CPU
>   * @cpu: Logical CPU number.
> - * @bus_number: The bus number assigned by the hardware.
> + * @bus_no: The bus number assigned by the hardware.
>   * @dev: The device number assigned by the hardware.
>   * @fn: The function number assigned by the hardware.
>   *
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
> index fdecdae248d7..35ff506b402e 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
> @@ -40,6 +40,7 @@
>   * @offset:	Offset to the first valid member in command structure.
>   *		This will be the offset of the start of the command
>   *		after command count field
> + * @owner:	Registered module owner
>   * @cmd_callback: Callback function to handle IOCTL. The callback has the
>   *		command pointer with data for command. There is a pointer
>   *		called write_only, which when set, will not copy the


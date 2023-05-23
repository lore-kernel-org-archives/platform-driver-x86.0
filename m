Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBC5C7EE26
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 10:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbjEWKxg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 06:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbjEWKxf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 06:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8B911F
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684839157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IRwLpBjF3y771Oa2kRIVwXk75u6DRLRrsAa1LNU04Go=;
        b=BDFicqRbabjB9JF9cLzTvL5q2HufblOtpwIeh4PXJdCSnh/kzOStWD1nz/AiKx+xljwHBD
        hshECsF4dTuAR8Qey26cdqMzDey4PAYHNfVUSSN9lNCmXD98AVTzFblnj+ypLcIRP86tM4
        MW1f7eP5EyCCW/5uuZ3aVhYRiOVTodY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-HBHk4r8eMV2Cnf3OUE9DaA-1; Tue, 23 May 2023 06:52:36 -0400
X-MC-Unique: HBHk4r8eMV2Cnf3OUE9DaA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-96f4f1bb838so532113166b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839155; x=1687431155;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRwLpBjF3y771Oa2kRIVwXk75u6DRLRrsAa1LNU04Go=;
        b=bqZ2rHqQHya1nLJWYZHYSXXTelDAD90PGXHl2OyTm6f7X4lKViTuQQbjoX1Qsg5HHG
         ftoOTVgqe9M5vDPZ+UCSi+cXeuxEgAcglOOtoEOt/bWrYNz/WSyJzIuiHbcY+NbWwH0w
         0/9VfaOv0TNOEWlDKEFad+iojBqIXVB040IMxkU8e4+LgzWmEgoE/sSB/Nw3drB3WAd9
         bt1t9pV8tXf/t8kf52s3ugy6IPqS/RRRwe+JV8Y8DdeNM3UqBJk8ZtYgTUbDsTmgmQWd
         aG1Bux4njWB2dIT9bzsV7fkucq6FGxRlUvJgAhXjuD3IhrVGsBwO216EvZWBvbJZkQKD
         B4oQ==
X-Gm-Message-State: AC+VfDzo3t0n8ep0zcl3aNt4M0crU9nJT7OFUVC937Z38wAZziVPtcct
        DfKNx4+1MTJ3uG80iJibVhlSXPRh631WGMB714Hs19Rb9t9P4rY+c/EXPQVXt4FcepVFmcIGvcE
        TfxfCzQnuk6pS5dV3V3lFaRkdffnChHBYSIpwLo5gUA==
X-Received: by 2002:a17:907:8a03:b0:96f:912e:5ec4 with SMTP id sc3-20020a1709078a0300b0096f912e5ec4mr11425490ejc.16.1684839155030;
        Tue, 23 May 2023 03:52:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Nbl1Vghh5ZdHqZZ5iGGQDxRmXaZZtG9X7gxBAsJ5YfMawF4xYsFX55IGJIy3Jewaqh9qB7Q==
X-Received: by 2002:a17:907:8a03:b0:96f:912e:5ec4 with SMTP id sc3-20020a1709078a0300b0096f912e5ec4mr11425469ejc.16.1684839154706;
        Tue, 23 May 2023 03:52:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gr6-20020a170906e2c600b009658264076asm4247104ejb.45.2023.05.23.03.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:52:34 -0700 (PDT)
Message-ID: <7c075199-df5a-2136-8bed-b2be102ed02e@redhat.com>
Date:   Tue, 23 May 2023 12:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: ISST: Remove 8 socket limit
Content-Language: en-US, nl
To:     Steve Wahl <steve.wahl@hpe.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230519160420.2588475-1-steve.wahl@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230519160420.2588475-1-steve.wahl@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/23 18:04, Steve Wahl wrote:
> Stop restricting the PCI search to a range of PCI domains fed to
> pci_get_domain_bus_and_slot().  Instead, use for_each_pci_dev() and
> look at all PCI domains in one pass.
> 
> On systems with more than 8 sockets, this avoids error messages like
> "Information: Invalid level, Can't get TDP control information at
> specified levels on cpu 480" from the intel speed select utility.
> 
> Fixes: aa2ddd242572 ("platform/x86: ISST: Use numa node id for cpu pci dev mapping")
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  .../x86/intel/speed_select_if/isst_if_common.c       | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index e0572a29212e..02fe360a59c7 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -304,14 +304,13 @@ struct isst_if_pkg_info {
>  static struct isst_if_cpu_info *isst_cpu_info;
>  static struct isst_if_pkg_info *isst_pkg_info;
>  
> -#define ISST_MAX_PCI_DOMAINS	8
> -
>  static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn)
>  {
>  	struct pci_dev *matched_pci_dev = NULL;
>  	struct pci_dev *pci_dev = NULL;
> +	struct pci_dev *_pci_dev = NULL;
>  	int no_matches = 0, pkg_id;
> -	int i, bus_number;
> +	int bus_number;
>  
>  	if (bus_no < 0 || bus_no >= ISST_MAX_BUS_NUMBER || cpu < 0 ||
>  	    cpu >= nr_cpu_ids || cpu >= num_possible_cpus())
> @@ -323,12 +322,11 @@ static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn
>  	if (bus_number < 0)
>  		return NULL;
>  
> -	for (i = 0; i < ISST_MAX_PCI_DOMAINS; ++i) {
> -		struct pci_dev *_pci_dev;
> +	for_each_pci_dev(_pci_dev) {
>  		int node;
>  
> -		_pci_dev = pci_get_domain_bus_and_slot(i, bus_number, PCI_DEVFN(dev, fn));
> -		if (!_pci_dev)
> +		if (_pci_dev->bus->number != bus_number ||
> +		    _pci_dev->devfn != PCI_DEVFN(dev, fn))
>  			continue;
>  
>  		++no_matches;


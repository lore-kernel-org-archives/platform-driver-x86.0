Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60635E7B5E2
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 09:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242069AbjJDJ5N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbjJDJ5I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 05:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D4DA7
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696413386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E1DL90R6jzcUOvYCR7LzgiipCsFwBXKgB5RMgIN+6tA=;
        b=EeeMuBcCjwhUFTuWv1Wyydhqu872r+be3Nd0poKlwsZVzuHcqlP/5wTivPp7A/w2j6oOGa
        ZoZaqlfkd7HlS4zNgcQ3Okkt6QioLiVn8iunoWktTkRBO6McgOqaWugKYgzg1FNF0rT3BC
        tg4hz95LjINlxF2AjL4b5WCvv+sRSRc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-K-iWmtsUPdm-_3KYzahCaA-1; Wed, 04 Oct 2023 05:56:25 -0400
X-MC-Unique: K-iWmtsUPdm-_3KYzahCaA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99c8bbc902eso89050066b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696413384; x=1697018184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1DL90R6jzcUOvYCR7LzgiipCsFwBXKgB5RMgIN+6tA=;
        b=WoukNxckfpYNjR0bnHNe1WMJ2q0KjBl0vO3oX2IX3clOCL5Ue8L7tDypHd9DqHlkmx
         If9TvqDjwjkOfkG30kcdxKoiSObUJT/OugpdcnHIV4TEEvzDPQdWyvjLM5UeAPdrdVmb
         0pbnIH2rYevI5TEn7Lggt0heo+FhxTenZRt52iOyH+HGF2dh50pvWy/BAur3qmyGrC7w
         Mz3x1HeN4QpUQcCof+pvppMACf5MSvUvpw/niWQ0OZ1kI4kRZ7iuf826I5sOziBuDB9a
         65JHwabgMUbqJjcmnRAIeXpKZRclYQ0ixvYnr+bLib4ZJudxa6NGrrwPi6odsyMfgrS4
         Xd4w==
X-Gm-Message-State: AOJu0Ywz6W8RQ4hb+WE2NEF8zCLizYHeKhWwkaMw9HIOFMAqmkHNKpto
        JtjcwjzBAX5+Y/2iSQerucTHAKrLx/bX+bAHMKF9QMaTI3xXJGH6yHBsLTB/vL7JkHmv+6Ea1EG
        D3pfpzIKn0VxW1AvT9Nz4JMaUKzL5QK4fOg==
X-Received: by 2002:a17:907:2714:b0:9b6:53a9:792c with SMTP id w20-20020a170907271400b009b653a9792cmr1453477ejk.15.1696413383917;
        Wed, 04 Oct 2023 02:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOdsxA7kVzXrKafctESY1Qt6iohQp1oHZyM4KbODjwKJuxippDztAc+7+t5+ZdDKityeNuAw==
X-Received: by 2002:a17:907:2714:b0:9b6:53a9:792c with SMTP id w20-20020a170907271400b009b653a9792cmr1453470ejk.15.1696413383737;
        Wed, 04 Oct 2023 02:56:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l12-20020a170906078c00b0099ce188be7fsm2518617ejc.3.2023.10.04.02.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:56:23 -0700 (PDT)
Message-ID: <015b0586-44b8-fa1f-a693-63edccd2cc66@redhat.com>
Date:   Wed, 4 Oct 2023 11:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/mellanox: tmfifo: fix kernel-doc warnings
Content-Language: en-US, nl
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>, Liming Sun <lsun@mellanox.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
References: <20230926054013.11450-1-rdunlap@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230926054013.11450-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/26/23 07:40, Randy Dunlap wrote:
> Fix kernel-doc notation for structs and struct members to prevent
> these warnings:
> 
> mlxbf-tmfifo.c:73: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_vring '
> mlxbf-tmfifo.c:128: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_vdev '
> mlxbf-tmfifo.c:146: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_irq_info '
> mlxbf-tmfifo.c:158: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_io '
> mlxbf-tmfifo.c:182: warning: cannot understand function prototype: 'struct mlxbf_tmfifo '
> mlxbf-tmfifo.c:208: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_msg_hdr '
> mlxbf-tmfifo.c:138: warning: Function parameter or member 'config' not described in 'mlxbf_tmfifo_vdev'
> mlxbf-tmfifo.c:212: warning: Function parameter or member 'unused' not described in 'mlxbf_tmfifo_msg_hdr'
> 
> Fixes: 1357dfd7261f ("platform/mellanox: Add TmFifo driver for Mellanox BlueField Soc")
> Fixes: bc05ea63b394 ("platform/mellanox: Add BlueField-3 support in the tmfifo driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: lore.kernel.org/r/202309252330.saRU491h-lkp@intel.com
> Cc: Liming Sun <lsun@mellanox.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Vadim Pasternak <vadimp@nvidia.com>
> Cc: platform-driver-x86@vger.kernel.org

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c |   14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff -- a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -53,7 +53,7 @@
>  struct mlxbf_tmfifo;
>  
>  /**
> - * mlxbf_tmfifo_vring - Structure of the TmFifo virtual ring
> + * struct mlxbf_tmfifo_vring - Structure of the TmFifo virtual ring
>   * @va: virtual address of the ring
>   * @dma: dma address of the ring
>   * @vq: pointer to the virtio virtqueue
> @@ -113,12 +113,13 @@ enum {
>  };
>  
>  /**
> - * mlxbf_tmfifo_vdev - Structure of the TmFifo virtual device
> + * struct mlxbf_tmfifo_vdev - Structure of the TmFifo virtual device
>   * @vdev: virtio device, in which the vdev.id.device field has the
>   *        VIRTIO_ID_xxx id to distinguish the virtual device.
>   * @status: status of the device
>   * @features: supported features of the device
>   * @vrings: array of tmfifo vrings of this device
> + * @config: non-anonymous union for cons and net
>   * @config.cons: virtual console config -
>   *               select if vdev.id.device is VIRTIO_ID_CONSOLE
>   * @config.net: virtual network config -
> @@ -138,7 +139,7 @@ struct mlxbf_tmfifo_vdev {
>  };
>  
>  /**
> - * mlxbf_tmfifo_irq_info - Structure of the interrupt information
> + * struct mlxbf_tmfifo_irq_info - Structure of the interrupt information
>   * @fifo: pointer to the tmfifo structure
>   * @irq: interrupt number
>   * @index: index into the interrupt array
> @@ -150,7 +151,7 @@ struct mlxbf_tmfifo_irq_info {
>  };
>  
>  /**
> - * mlxbf_tmfifo_io - Structure of the TmFifo IO resource (for both rx & tx)
> + * struct mlxbf_tmfifo_io - Structure of the TmFifo IO resource (for both rx & tx)
>   * @ctl: control register offset (TMFIFO_RX_CTL / TMFIFO_TX_CTL)
>   * @sts: status register offset (TMFIFO_RX_STS / TMFIFO_TX_STS)
>   * @data: data register offset (TMFIFO_RX_DATA / TMFIFO_TX_DATA)
> @@ -162,7 +163,7 @@ struct mlxbf_tmfifo_io {
>  };
>  
>  /**
> - * mlxbf_tmfifo - Structure of the TmFifo
> + * struct mlxbf_tmfifo - Structure of the TmFifo
>   * @vdev: array of the virtual devices running over the TmFifo
>   * @lock: lock to protect the TmFifo access
>   * @res0: mapped resource block 0
> @@ -198,7 +199,7 @@ struct mlxbf_tmfifo {
>  };
>  
>  /**
> - * mlxbf_tmfifo_msg_hdr - Structure of the TmFifo message header
> + * struct mlxbf_tmfifo_msg_hdr - Structure of the TmFifo message header
>   * @type: message type
>   * @len: payload length in network byte order. Messages sent into the FIFO
>   *       will be read by the other side as data stream in the same byte order.
> @@ -208,6 +209,7 @@ struct mlxbf_tmfifo {
>  struct mlxbf_tmfifo_msg_hdr {
>  	u8 type;
>  	__be16 len;
> +	/* private: */
>  	u8 unused[5];
>  } __packed __aligned(sizeof(u64));
>  
> 


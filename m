Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66483E7B5E1
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 09:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbjJDJiu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbjJDJit (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 05:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0C4A7
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696412277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2kiM+RZYaHJrzNZdUIGwt79zYPhKupy1yf3nvUQfCno=;
        b=YDYg3R0igdckQT+io2WNhfrb72D4rOpiAoYCgdWt9pyaCWzwT1YV9gAIniEQuv0dV255Cy
        qbnxTv5uKLpjjsm1YwPVY5uZ0zVZMWODayDVFfcuZBgZ3kGWbLtY9ssMdLQscDzt1wU/07
        /yKnIP+w2YW6MNQlkQS3ZGI6OqUbXZ0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-M-oCOjeWOn-mez-MjexJPQ-1; Wed, 04 Oct 2023 05:37:47 -0400
X-MC-Unique: M-oCOjeWOn-mez-MjexJPQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae42088b4bso164193466b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 02:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412266; x=1697017066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kiM+RZYaHJrzNZdUIGwt79zYPhKupy1yf3nvUQfCno=;
        b=dQBZxmEwmm57Z2KOCxKKAGz74Udx0ZQyS/GyinVrTaGCS3aKxFjCewm+LcMwl4t85b
         1lJYmHBHanba59bOecDrVpKRoi98xal3JJuZHeKtwaEgjlLdbKAllZdkzr7tCNyxLykr
         SKlQLyNrisMK/vAO2qBh181uUGZ2cJwIdT5QlObWWbPMet8eAcwKP+05wueC1aX1fCY8
         /I5nyagqHnmEsI4JC4luY7c8rZqqU6mAgmgRTi2bkQR2z+kf7dmFUH11UOYfJVFoA0yK
         MIiMJtO2hG7+u7Lr3vaLCK71eLWP2RmzHkm2s/WR0uifOmVCHw0h1KGJY2OyACddNQvb
         TxZw==
X-Gm-Message-State: AOJu0YzT79g3Ta2Q6Nm94WIHmSUraqutQ2r412GgSbOWJfeqA0q4nd8r
        G1TztIwizDSGkewjAm9e7D9UA+5t4jOo6OLnzBZGrRzajoxEb2YsJ65rNkgpRtMgsevmIzwVAZP
        W66mm2wKj11e5Frse1YSO1NR/mxQGrpS9gg==
X-Received: by 2002:a17:906:53d2:b0:9ad:e2c8:1741 with SMTP id p18-20020a17090653d200b009ade2c81741mr1694250ejo.58.1696412266520;
        Wed, 04 Oct 2023 02:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB7HWoT+YT1F6ro+pyLOI8P/MyLEpdp3rX69QDKpV0cLy88MT0YcSRmdXz1QWgJT5Y/C7+wg==
X-Received: by 2002:a17:906:53d2:b0:9ad:e2c8:1741 with SMTP id p18-20020a17090653d200b009ade2c81741mr1694239ejo.58.1696412266248;
        Wed, 04 Oct 2023 02:37:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906378c00b0098ec690e6d7sm2495877ejc.73.2023.10.04.02.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:37:45 -0700 (PDT)
Message-ID: <c93dda64-b5d3-7daa-5d43-4e3e6b0ee1db@redhat.com>
Date:   Wed, 4 Oct 2023 11:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [bug report] platform/mellanox: Add BlueField-3 support in the
 tmfifo driver
Content-Language: en-US, nl
To:     Dan Carpenter <dan.carpenter@linaro.org>, limings@nvidia.com,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <fc905665-465a-4929-8fb2-1dcc2aa4db04@moroto.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fc905665-465a-4929-8fb2-1dcc2aa4db04@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc Vadim, David.

On 9/28/23 14:23, Dan Carpenter wrote:
> Hello Liming Sun,
> 
> The patch bc05ea63b394: "platform/mellanox: Add BlueField-3 support
> in the tmfifo driver" from Oct 18, 2022 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/platform/mellanox/mlxbf-tmfifo.c:634 mlxbf_tmfifo_rxtx_word()
> 	error: uninitialized symbol 'data'.

Dan as always thank you for reporting this.

Liming, David, Vadim,

Can one of you take a look at this please ?

Regards,

Hans



> 
> drivers/platform/mellanox/mlxbf-tmfifo.c
>     592 static void mlxbf_tmfifo_rxtx_word(struct mlxbf_tmfifo_vring *vring,
>     593                                    struct vring_desc *desc,
>     594                                    bool is_rx, int len)
>     595 {
>     596         struct virtio_device *vdev = vring->vq->vdev;
>     597         struct mlxbf_tmfifo *fifo = vring->fifo;
>     598         void *addr;
>     599         u64 data;
>     600 
>     601         /* Get the buffer address of this desc. */
>     602         addr = phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
>     603 
>     604         /* Read a word from FIFO for Rx. */
>     605         if (is_rx)
>     606                 data = readq(fifo->rx.data);
>     607 
>     608         if (vring->cur_len + sizeof(u64) <= len) {
>     609                 /* The whole word. */
>     610                 if (!IS_VRING_DROP(vring)) {
>     611                         if (is_rx)
>     612                                 memcpy(addr + vring->cur_len, &data,
>     613                                        sizeof(u64));
>     614                         else
>     615                                 memcpy(&data, addr + vring->cur_len,
>     616                                        sizeof(u64));
>     617                 }
> 
> if IS_VRING_DROP() is true then data isn't intialized.
> 
>     618                 vring->cur_len += sizeof(u64);
>     619         } else {
>     620                 /* Leftover bytes. */
>     621                 if (!IS_VRING_DROP(vring)) {
>     622                         if (is_rx)
>     623                                 memcpy(addr + vring->cur_len, &data,
>     624                                        len - vring->cur_len);
>     625                         else
>     626                                 memcpy(&data, addr + vring->cur_len,
>     627                                        len - vring->cur_len);
>     628                 }
> 
> Same here.
> 
>     629                 vring->cur_len = len;
>     630         }
>     631 
>     632         /* Write the word into FIFO for Tx. */
>     633         if (!is_rx)
> --> 634                 writeq(data, fifo->tx.data);
>                                ^^^^
> Unitialized if IS_VRING_DROP() is true.
> 
>     635 }
> 
> regards,
> dan carpenter
> 


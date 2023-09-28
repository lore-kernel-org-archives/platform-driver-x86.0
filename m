Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAB3E732C5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 12:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjI1MXb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 08:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjI1MXa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 08:23:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E68139
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:23:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso98810955e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695903806; x=1696508606; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgXr5vJl2laI3yDBdLjqRsy9iHs9ecAkAsE4nQ6DIcs=;
        b=kJYBbSqSKJNjbLGrKjpg5w4Qk5Ln1ewKkf9SrEoJeSf7pNZUzOV23fPSmTwA5V5lti
         3DDTomwqLYEemtDyHlFbpyDgp4VleiftAvzcugN/JGci3qBWCBIGlYlK3TL0NZt/Wujc
         Is8IkA+1S7FlPszk9xihA8oiH+2MDJ3eZI6PiHxfoKARQ6kYb69q2UxrUisPoUrbWiIJ
         KSTTAPEI5wNGn9j7jL87is5VbBJteRJDdXhSzZxiEJCBA1NRjAoQcWerVCiz2dPzUA6K
         KMEKbenJVUAoQ3elpdiE9wiNPOT4CXJhpgAnVs+DbQCXoknGqcFQLDTYRCt1exzAVMR2
         nlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695903806; x=1696508606;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgXr5vJl2laI3yDBdLjqRsy9iHs9ecAkAsE4nQ6DIcs=;
        b=ocEvBuIQWrrlbVtniNJgEDxz0/3YVVRPobs1+Nksp0ERgD7CcUaaflFETYD6UTQpNT
         ITX4wE9BEC3DmbzIIFq1l1AnV3nOjCMw8zQPqvm5qCd+ww8f5MWI7gj5NJn3jQmCTv/+
         Uo4Ypb3joI+gDVjLKeny7i06OCeGfXBBYt4KeBBaQrWhziUTBYolZzUrWTpVqv810AWK
         tROf6TBNb+n9WY8Xop3JRMWC0D82tHZfvWWGuQJMEZTLargbG0QJU6GkfQk6+XhFt3uu
         ziiNKMF+bOtYA/Crzm3fdsJEe89arIQcPrFIsTCcYGIw+yqdO5s5wWyXuEIL46sNxzfs
         ajAg==
X-Gm-Message-State: AOJu0Yx5xGU2eJ5WK+Gi3QaSY2wIUB0Ef94TGIs9I0NXrYMUQZlkBfWW
        2ay0VwNChnJZADanq/A34VqDGhJe8zl88F/8ybQ=
X-Google-Smtp-Source: AGHT+IGF1W3UdkQ+BGebTWCooyVwk4zEQMXL1OO5D5VwVDtJZWNzBQ4G6CtjIyfbUVTOhzZn2HaJfg==
X-Received: by 2002:adf:f091:0:b0:314:1b36:f440 with SMTP id n17-20020adff091000000b003141b36f440mr960775wro.70.1695903806495;
        Thu, 28 Sep 2023 05:23:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w10-20020adfd4ca000000b0031762e89f94sm19176560wrk.117.2023.09.28.05.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 05:23:26 -0700 (PDT)
Date:   Thu, 28 Sep 2023 15:23:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     limings@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/mellanox: Add BlueField-3 support in the
 tmfifo driver
Message-ID: <fc905665-465a-4929-8fb2-1dcc2aa4db04@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Liming Sun,

The patch bc05ea63b394: "platform/mellanox: Add BlueField-3 support
in the tmfifo driver" from Oct 18, 2022 (linux-next), leads to the
following Smatch static checker warning:

	drivers/platform/mellanox/mlxbf-tmfifo.c:634 mlxbf_tmfifo_rxtx_word()
	error: uninitialized symbol 'data'.

drivers/platform/mellanox/mlxbf-tmfifo.c
    592 static void mlxbf_tmfifo_rxtx_word(struct mlxbf_tmfifo_vring *vring,
    593                                    struct vring_desc *desc,
    594                                    bool is_rx, int len)
    595 {
    596         struct virtio_device *vdev = vring->vq->vdev;
    597         struct mlxbf_tmfifo *fifo = vring->fifo;
    598         void *addr;
    599         u64 data;
    600 
    601         /* Get the buffer address of this desc. */
    602         addr = phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
    603 
    604         /* Read a word from FIFO for Rx. */
    605         if (is_rx)
    606                 data = readq(fifo->rx.data);
    607 
    608         if (vring->cur_len + sizeof(u64) <= len) {
    609                 /* The whole word. */
    610                 if (!IS_VRING_DROP(vring)) {
    611                         if (is_rx)
    612                                 memcpy(addr + vring->cur_len, &data,
    613                                        sizeof(u64));
    614                         else
    615                                 memcpy(&data, addr + vring->cur_len,
    616                                        sizeof(u64));
    617                 }

if IS_VRING_DROP() is true then data isn't intialized.

    618                 vring->cur_len += sizeof(u64);
    619         } else {
    620                 /* Leftover bytes. */
    621                 if (!IS_VRING_DROP(vring)) {
    622                         if (is_rx)
    623                                 memcpy(addr + vring->cur_len, &data,
    624                                        len - vring->cur_len);
    625                         else
    626                                 memcpy(&data, addr + vring->cur_len,
    627                                        len - vring->cur_len);
    628                 }

Same here.

    629                 vring->cur_len = len;
    630         }
    631 
    632         /* Write the word into FIFO for Tx. */
    633         if (!is_rx)
--> 634                 writeq(data, fifo->tx.data);
                               ^^^^
Unitialized if IS_VRING_DROP() is true.

    635 }

regards,
dan carpenter

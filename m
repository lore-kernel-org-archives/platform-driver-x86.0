Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072F0ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Sep 2022 08:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiIKIuf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Sep 2022 04:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiIKIuL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 04:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2455D3340C
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662886144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=oVpBX6mD5sYbnJT6cfmvCoSDhOdUYUr1ikg5N0CVDQo=;
        b=OVbgamCatNnIwz1FMAANTW213J3c8JpFSdr9+AgBfBqTsi4iv5VAmudNaDk03vI131YU02
        s1elhPE2JRuIPGZysL/5ifvrKe1Iqd326ZgoMsKf2LxYFO7WVCYz6EpN/SA0Iopgoeoh+S
        n3lJmRX6wUFd6kXmeaRlDSUljRGxMes=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-O4sMXRvDPVuqaGZn2FRhQA-1; Sun, 11 Sep 2022 04:49:00 -0400
X-MC-Unique: O4sMXRvDPVuqaGZn2FRhQA-1
Received: by mail-ej1-f72.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso414226ejb.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 01:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=oVpBX6mD5sYbnJT6cfmvCoSDhOdUYUr1ikg5N0CVDQo=;
        b=6CiHomcuSb13NpJnBDyDt1GiGKzN065Jdp7G+Cf3ZXoWmUKQ9ypgeVVrk66PcdeHxu
         ZNIPX9cjTjzppFU39Q+3JxPxlAhijplDKZ2jd9PfFja8he+1OGl9J7vC3v7vnBAqnvXZ
         kohQBtT3XYCBX5w2nrAfEtYU6AdxF5TCm6AW3ni0wiu9Rwe8Ve//uYhyLMkdV5l4RpIQ
         2rPPOTJcOlqtVK0E+xh+n/qOMIcEF2KpNaYWM/89U+dBJQEdY+asVS6vZVSr/kyH+s27
         XVd7BkcrneF9DBI+HNVQDhMSnGOuevT0kWWvk79nCQrQu36ReDtprABAn+bqS+CwkXyt
         PGXA==
X-Gm-Message-State: ACgBeo071v6p1BJzI2Sk0N6XT6yDypTmFMn85kuPmZQhvoGW7OHGM8dT
        FBRPVCZmAtoVuyOYmgA/cbAxogZecVMF9bWN2MKIS7ECyuPD2hToQ+PGO0l/XXhzvSkZ9XG9Y//
        SgAdmSR/yv8RrYPwJm4sqkNVQrLV/EVnxTw==
X-Received: by 2002:a17:907:d9e:b0:776:d0a7:7775 with SMTP id go30-20020a1709070d9e00b00776d0a77775mr10855162ejc.38.1662886139495;
        Sun, 11 Sep 2022 01:48:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/OOxA9St87Sag7c0rkFDUgl2hCb936GGhKs4kbJYpd1crYNejoyVtHXtsvx5MLsZI7uk1nQ==
X-Received: by 2002:a17:907:d9e:b0:776:d0a7:7775 with SMTP id go30-20020a1709070d9e00b00776d0a77775mr10855160ejc.38.1662886139309;
        Sun, 11 Sep 2022 01:48:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906300d00b00770880dfc4fsm2675777ejz.29.2022.09.11.01.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 01:48:58 -0700 (PDT)
Message-ID: <b6a28173-636b-a51f-06a2-6e27083e5520@redhat.com>
Date:   Sun, 11 Sep 2022 10:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: mlxreg_lc_probe() warn: variable dereferenced before check
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Vadim,

The kernel test robot pointed me to the following warning in my tree:

drivers/platform/mellanox/mlxreg-lc.c:903 mlxreg_lc_probe() warn: variable dereferenced before check 'data->notifier' (see line 828)

I took a quick peek and data comes from:

        data = dev_get_platdata(&pdev->dev);

And then indeed after that if data != NULL data-> notifiers gets derefenced
unconditionally in the normal code path:

        /* Set event notification callback. */
        data->notifier->user_handler = mlxreg_lc_event_handler;
        data->notifier->handle = mlxreg_lc;

Where as the error exit path has:

        /* Clear event notification callback and handle. */
        if (data->notifier) {
                data->notifier->user_handler = NULL;
                data->notifier->handle = NULL;
        }

It seems to me that either both uses of data->notifier need a check;
or none of the two uses of data->notifier need a check ?

Can you take a look at this please?  (and cook up a patch ?)

Regards,

Hans



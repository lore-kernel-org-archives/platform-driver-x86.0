Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ECDCD37B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 16:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjIRQm6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 12:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjIRQmr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 12:42:47 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EB935B8
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 09:40:43 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9adb9fa7200so957979366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695055241; x=1695660041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnkkugxRsOUXIkpkK3b/8Sk3NM5MFsR8RPaYmrTxY1I=;
        b=bpndAbG/4Xsq+2kta0YqUiWvwM7QQwHuoeWfsQpfiMmoZOig+FmzTcT8Y9MqiHEdfa
         xzgngIDHJ/On7PitBsC2cWXwK9/YCikPGWZfDbZZ4H7vtgYt1ioGTFxgMjMGAjRmOcuV
         LVWBoJ6sYp1FY0zm84OKS2ahBSyLxiQ996KEj863Ox4VRPWMMf0CvTQ5sjPtgcAVF36v
         eZhWm4pKVHBJNS20hQftt3Ujg+7tOL1nXIavzO7x3qxxGiWZ9DBOK90rhEPXbwNUXhPi
         VRggTlrMMWdn77weBJAlt8mkGby9fevTrjuKdmZjMJ8TFQ+ztIkUkdVFmUS38gOeeIlq
         D20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695055241; x=1695660041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cnkkugxRsOUXIkpkK3b/8Sk3NM5MFsR8RPaYmrTxY1I=;
        b=T63xZHl7UZJ1k/rS5BjOlJtvFMq5urvv3qgZMJs+wSPtnR13rVgHQv/eY8PQDpM5fG
         tmaPdmWKlp0A1dnZe0nBoE8LxG69+ADLDXNIgBvUOtlKht50YAfDG2pr2aTM7a9ahUO7
         maGri3r8n3rSaRAKam7monbRfsWO7eC6eyoH1wtCwJoQgSCK+cYF+2hiu3Y9wR2fUmNb
         AzpVZrbGecSNTb5uYBdt8p/NlaNo9vv2ingnu/hpXzvGnzT7nzsjNT1C5lhcycCq7vfA
         DqCQTaHXy9j5XUZ7HoIfoeRdurVy58YLL+jrsTcAAsFrZcE9qD/lsX6HvYC+XgGSj2zb
         lUDA==
X-Gm-Message-State: AOJu0YziunBG/VArEpZB5pLmbZo66MvKYOWGxu5QPikS53RmpcSXyUbZ
        UyMZNKOXNhRpC1pZDAv1bCdkfEjQe/A=
X-Google-Smtp-Source: AGHT+IFCKkWL6c1UFF+Sb02mSZUkNNedZVihWxGgRVqRYdC4WWcvyFn+Au3XDIZyqgmmRcV1/pwudQ==
X-Received: by 2002:a7b:ce85:0:b0:402:ea8c:ea57 with SMTP id q5-20020a7bce85000000b00402ea8cea57mr6470234wmj.7.1695045721090;
        Mon, 18 Sep 2023 07:02:01 -0700 (PDT)
Received: from [10.126.144.131] (ufr-132-230-194-172.eduroam-nat.uni-freiburg.de. [132.230.194.172])
        by smtp.gmail.com with ESMTPSA id l12-20020a1ced0c000000b003fed4fa0c19sm15296679wmh.5.2023.09.18.07.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:02:00 -0700 (PDT)
Message-ID: <2ecf9f5a-6425-964e-6ca3-b4de7b9f74e0@gmail.com>
Date:   Mon, 18 Sep 2023 16:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/7] platform/surface: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 17/09/2023 um 22:37 schrieb Uwe Kleine-König:
> Hello,
> 
> this series converts all platform drivers below drivers/platform/surface
> to use .remove_new. The motivation is to get rid of an integer return
> code that is (mostly) ignored by the platform driver core.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (7):
>    platform/surface: surface3-wmi: Convert to platform remove callback
>      returning void
>    platform/surface: acpi-notify: Convert to platform remove callback
>      returning void
>    platform/surface: aggregator-cdev: Convert to platform remove callback
>      returning void
>    platform/surface: aggregator-registry: Convert to platform remove
>      callback returning void
>    platform/surface: dtx: Convert to platform remove callback returning
>      void
>    platform/surface: gpe: Convert to platform remove callback returning
>      void
>    platform/surface: hotplug: Convert to platform remove callback
>      returning void
> 
>   drivers/platform/surface/surface3-wmi.c                | 5 ++---
>   drivers/platform/surface/surface_acpi_notify.c         | 6 ++----
>   drivers/platform/surface/surface_aggregator_cdev.c     | 5 ++---
>   drivers/platform/surface/surface_aggregator_registry.c | 5 ++---
>   drivers/platform/surface/surface_dtx.c                 | 5 ++---
>   drivers/platform/surface/surface_gpe.c                 | 6 ++----
>   drivers/platform/surface/surface_hotplug.c             | 6 ++----
>   7 files changed, 14 insertions(+), 24 deletions(-)
> 
> 
> base-commit: dfa449a58323de195773cf928d99db4130702bf7

If it's not too late:

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks,
Max

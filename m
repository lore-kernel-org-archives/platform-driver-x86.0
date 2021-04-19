Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7978C433B4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 08:16:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A388961107
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 08:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhDSIQi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51621 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229537AbhDSIQi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Apr 2021 04:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618820168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JnDEYEE9+/ffQbifunOsMpxHXhGv1BfNRAdL9IDBXjA=;
        b=DH8P8n4+evXWn9qUwE8Fe/VPbt46HKdesqI4d0EzhUlUFmau7s0Bs3IQ/+jkDlcMAmHuMT
        x9KzQ/AR3IAIpMHf3SjA8TYjAbCJrqhLIMfGNTzIuka+9FsjusG+8Be6zSr8YPMjp1zOmX
        rwihGZYeViZTmDGDYh92HbOkmSQtKrY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-1Oh8E49cOOekdHqSZyTGpw-1; Mon, 19 Apr 2021 04:16:06 -0400
X-MC-Unique: 1Oh8E49cOOekdHqSZyTGpw-1
Received: by mail-ej1-f71.google.com with SMTP id r14-20020a1709062cceb0290373a80b4002so3349339ejr.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Apr 2021 01:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JnDEYEE9+/ffQbifunOsMpxHXhGv1BfNRAdL9IDBXjA=;
        b=h2vQfgfGrGgQwA1DPV8Rbz5omVWNywro9MdvscerfbxFJvL4umuNGAYRNC1TyluY5U
         7JbIdmlL1u5ZZ7psQVAUoJX3ihPjA908Q44B7/ZGk2w/+65Qor9TTNElbtoXXyeOV9IA
         emfqKqH3iGoBrj0ot0D65A5EXfiQDDjjWUO3/CdmoDRN/04yVKl0HoUAnBgvvmN1W/ti
         9/gJb3LuaXjNKzFi3tVtsmo2mgay8c0u9Yv8QssHRRsg3wvA6OEhbdLgQRnInPuBwi47
         ruJG9fJUi4a3Yq5pwlQ7ipXG/isw3aWjiPWt100fPi+Na53ooSDjWEhzAjvO4GbK5SiD
         +ttQ==
X-Gm-Message-State: AOAM533ziJVUkBaiMsktuIgNeLawNBSN2F9YqeYeb/InlJiUUhKoe1w2
        Ay9FOw7PfcRLidHDSjyrJBnG8ajEqC4rvSq2GWCBwlwpWEl36HFa2vme6iVpxn0WRKy96rDKzfH
        6BqgtED+Wx5MMWIHnobejilvbeSr5IWtx5A==
X-Received: by 2002:a17:906:11d8:: with SMTP id o24mr20324024eja.386.1618820165382;
        Mon, 19 Apr 2021 01:16:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYTflUgzSh88RBm+qsxBK0KZOzb/fxkTKVyINlURGTVqeg7DWTSFZipvH/iIcrSHdj2bcuZQ==
X-Received: by 2002:a17:906:11d8:: with SMTP id o24mr20324015eja.386.1618820165277;
        Mon, 19 Apr 2021 01:16:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bu8sm8410081edb.77.2021.04.19.01.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 01:16:04 -0700 (PDT)
Subject: Re: [PATCH 0/2] Remove GA14/15 quirks to acpi/video_detect
To:     Luke Jones <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210419074915.393433-1-luke@ljones.dev>
 <c16dcaa8-83a3-2027-6335-52689eee5622@redhat.com>
 <M0XSRQ.41V51K2O2UAK@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3e0af231-f835-bda6-ee43-87fcde6439e5@redhat.com>
Date:   Mon, 19 Apr 2021 10:16:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <M0XSRQ.41V51K2O2UAK@ljones.dev>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/19/21 10:02 AM, Luke Jones wrote:
> NP Hans, sorry about the length of time this took. Other duties etc.
> 
> I appreciated the wealth of insight you were able to provide to enable this.

BTW, I see that your drivers/acpi/video_detect.c patch is marked as [PATCH 1/3] I
guess these 2 patches are patch 2/3 and 3/3 ?  You may want to send a reply to
your own patch to make that clear and to explain that it is a standalone
patch.

Please Cc my on the reply.

Regards,

Hans


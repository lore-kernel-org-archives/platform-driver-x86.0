Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA13C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 08:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjBTIpo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 03:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjBTIpn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 03:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEA9CDC4
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 00:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676882698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CVwbB9vj5JGqHdtOSPTFqf81luv/Tjq9qbnrv1u6j1A=;
        b=btdT/c8aNf+c4g9kFHgUlxoa3TXkNOaZurDMJMhC252BoQkJVT3MWbbNRGbJ3u7BtHb7mK
        9nUTSlEZ0DqukTWhL4vXKsYHxqjIQJAb8tg9sHd/UAj9XCr5lj+rV1eUWesmWHkvvqmTOD
        7d+7b1NsVC/Z2VRSvYAiVMY4bhQGBlo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-XES7GdjKMdyllwMUrKnsZw-1; Mon, 20 Feb 2023 03:44:56 -0500
X-MC-Unique: XES7GdjKMdyllwMUrKnsZw-1
Received: by mail-ed1-f71.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso779692edb.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 00:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVwbB9vj5JGqHdtOSPTFqf81luv/Tjq9qbnrv1u6j1A=;
        b=t4WicPN+v8EQCFQKgnHJOW/oQKrY7Kt12M7GZl25btI7GyBg0SXRzXsqarsPr8Zcrd
         JvN8i0ntYh8QXjqLjPHVtgmgBkXsorZobzkApJuDU4ik31PQiUGIwti7NGI54lp706Wu
         ObHwZCn3dBo/V4LE3xILocMwj+lmywlIiIo8j323etyl0PPoBGhhXruQ9HoScT3YCVj2
         WF8OZ2Kxz0gg/eXxDfyJ9R9/6QU1lOg7RQ8VF6xsEmLYH3T0HFHVroG/H/j9iTi/H1wF
         byVtUD9fF9funacm4DNnslxJ5/QtZp/NI144DEwI2I/eTU1STFtGoUVYx6n+orEFATIQ
         iBiA==
X-Gm-Message-State: AO0yUKXZaxIAoJm9XJxrt7ZmPkfnh5a/o/gpd0xtOf9CUdo36xK26tOj
        PnHUNg0jJfnTL75aAu0cZhKAXG/93yrbQubWUXpxgt5Shu4swwlyRbG1D4Ec5fnskK0tx42xS5r
        UXAyRl+1yWnulXSm7FF0HureVH0qEw9R/cfEchwA=
X-Received: by 2002:aa7:d048:0:b0:4ab:554:37ea with SMTP id n8-20020aa7d048000000b004ab055437eamr863287edo.4.1676882695616;
        Mon, 20 Feb 2023 00:44:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+dK6utNFx1klK6L8QHAdHzNgx1cFyKD6UbBPI4X5Tz1NKwtst7hxuAgxNJSDdxEWTM7hX3mQ==
X-Received: by 2002:aa7:d048:0:b0:4ab:554:37ea with SMTP id n8-20020aa7d048000000b004ab055437eamr863277edo.4.1676882695373;
        Mon, 20 Feb 2023 00:44:55 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id co10-20020a0564020c0a00b004aab66d34c7sm1088295edb.7.2023.02.20.00.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 00:44:54 -0800 (PST)
Message-ID: <8f2cdd8e-70a5-e2fa-6b63-45ca029e39be@redhat.com>
Date:   Mon, 20 Feb 2023 09:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] apple-gmux: support MMIO gmux on T2 Macs
Content-Language: en-US
To:     Lukas Wunner <lukas@wunner.de>,
        Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Seth Forshee <sforshee@kernel.org>,
        Aditya Garg <gargaditya08@live.com>,
        Aun-Ali Zaidi <admin@kodeit.net>,
        Kerem Karabay <kekrby@gmail.com>
References: <20230216122342.5918-1-orlandoch.dev@gmail.com>
 <20230216122342.5918-5-orlandoch.dev@gmail.com>
 <cd6beabe-3026-d84e-63fd-3833948ecc1f@redhat.com>
 <20230217110531.6d3c07a1@redecorated-mbp> <20230219133956.GA4946@wunner.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230219133956.GA4946@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/19/23 14:39, Lukas Wunner wrote:
> On Fri, Feb 17, 2023 at 11:05:31AM +1100, Orlando Chamberlain wrote:
>> On Thu, 16 Feb 2023 14:27:13 +0100 Hans de Goede <hdegoede@redhat.com> wrote:
>> It looks like iMac20,1, iMac20,2, and iMacPro1,1 have APP000B:
>>
>> apple_gmux: Failed to find gmux I/O resource
>>
>> iMac20,2: https://linux-hardware.org/?probe=ec2af584b3&log=dmesg
>> iMac20,1: https://linux-hardware.org/?probe=fee7644b9c&log=dmesg
>> iMacPro1,1: https://linux-hardware.org/?probe=6c26c9ff8c&log=dmesg
>>
>> But I'm not sure if they actually have it or not.
> 
> A number of iMacs support Target Display Mode, i.e. you can plug in
> an external computer to the iMac's DisplayPort and use the iMac as
> its screen.  Those iMac models do contain a gmux to mux the display
> between internal GPU and external DisplayPort connection.  Linux
> does not have support for this, sadly.  It would require generalizing
> vga_switcheroo for use cases beyond dual GPU laptops.  Florian Echtler
> has been looking into Target Display Mode but I'm not sure he got it
> working:
> 
> https://lore.kernel.org/all/e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org/
> https://lore.kernel.org/all/71a48bf5-54b5-6d7b-d574-e0aa6c1acb80@butterbrot.org/
> https://lore.kernel.org/all/1497603751-22360-1-git-send-email-floe@butterbrot.org/
> 
> I believe the Mac Pro (the trashcan one) also contains a gmux and
> an APP000B device in DSDT.  I recall seeing a bug report due to a
> splat in the gmux driver on that machine.  Back then I confirmed
> in the schematics that it does contain a gmux, though I think it's
> only used for brightness, not GPU switching.

Erm, the Mac Pro (the trashcan one) does not have an internal LCD
panel, right?  So I don't think the gmux will be used for brightness
control there ...

Regards,

Hans


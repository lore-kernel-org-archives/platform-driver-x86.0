Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8FEC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 18:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiKJSrQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiKJSrP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 13:47:15 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87571005B
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 10:47:13 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 21so4491782edv.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 10:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgu1ka2iMa7CyCCmZsqUlrFkuGKQ+eGIJOkxUecIZCc=;
        b=ArxTkyt4M33DJW7UsPSVLeGfhvZmiPVze8xGTEFh5YgfejP10ctkrnkCQjD3TcwKtz
         f+egKLYTIVzRlcQO9klhHPBXP4VLJ0QM97l8d5JNhgQazCZZQ5p+fcg7uGmMnfNXla5l
         VcOmOr0zrw4EQ+oTYPALNpeHn/QWMaugSq0X6EAUMgCLuE4nnh+Cl+GezAkDVHq8Csxs
         0i5WhhZsYzHhoA+5QKpkd4MPIwkusACMaybbMqp529qYVy3s3qFXDZA6AykgH0N8SSNl
         keFS4THKtPe6xKGsvfUgoSTomoUFvAXg8UQf7RCGdbf+RZu33ekVZTwV2THuhcb1PWUY
         Gkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hgu1ka2iMa7CyCCmZsqUlrFkuGKQ+eGIJOkxUecIZCc=;
        b=713+5PHWIn9owregOb/cav6t7pfUuS6cnU97EcNQxKZi/evF8kqEmgKz1GfbEr9Wab
         XmA8dJLvEwdlL3FTfba5RTHoaz6+ikYsauqOCnGlmsKFKi9P8tqzZVysVCBi5Xa2xz4c
         sKpQhcnXEmK92B/mjU9bPhMQO40vIaafwjLP+Mwx6FTCFqZnXuczuywdI9fYLj0NICwS
         cY36TdqQaEyky1mfIMXIP9l/MDvyI0Tl4Zw1+b1ECn4GqPD0x4skcoSz8Jv0LjjKw2vS
         QsDzD1TNyeytdq9DjkG+uX1eFmir+DmE+V5HX6AJCN/SJT8lb06OPkku39IQ2e9nv6cZ
         anuQ==
X-Gm-Message-State: ACrzQf2c6fSFjfMl5VlLpjck+F7toHxqnrUEX4zSgIYJRAGL1QpgdGkg
        EGRoiqnV/6ysSeMLmj2rYpA=
X-Google-Smtp-Source: AMsMyM4VytpngNLUNWKuNxoGYz3WIhBoQhxWwR9Hq6gIU9UJqsSUV71Fn0wmGJIeqsWFhsQkyFYNKw==
X-Received: by 2002:a05:6402:b72:b0:461:9349:79cf with SMTP id cb18-20020a0564020b7200b00461934979cfmr2948121edb.179.1668106032148;
        Thu, 10 Nov 2022 10:47:12 -0800 (PST)
Received: from eray-Lenovo-Z50-70.. ([188.132.247.187])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056402401200b004580862ffdbsm143145eda.59.2022.11.10.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:47:11 -0800 (PST)
From:   =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>
To:     maxtram95@gmail.com
Cc:     cleverline1mc@gmail.com, erayorcunus@gmail.com,
        g_goessel@outlook.com, hdegoede@redhat.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, limanyi@uniontech.com,
        mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Date:   Thu, 10 Nov 2022 21:47:09 +0300
Message-Id: <20221110184709.52768-1-erayorcunus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com> <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com> <20221110120022.35041-1-erayorcunus@gmail.com> <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com> <20221110164220.46640-1-erayorcunus@gmail.com> <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10 Nov 2022 at 21:09, Maxim Mikityanskiy <maxtram95@gmail.com>  wrote:
> A small note on the DMI allow-list: I don't think Z570 is the only
> laptop where EC fails to disable the touchpad. While I would like this
> hack to affect as few laptops as possible, I would expect that other
> similar models produced in the same time period suffer from the same
> issue, and I don't think we have the full list of them.

I just checked Z570 ACPI table, and this is what it does when it receives
VPCCMD_R_TOUCHPAD:

	VDAT = TPEN /* \_SB_.PCI0.LPCB.EC0_.TPEN */
	If ((TPEN == One))
	{
	    GL04 |= 0x02
	}
	Else
	{
	    GL04 &= 0xFD
	}

VDAT is the data returned to user.
So we can say that TPEN is the logical state of touchpad key, and GL04
is state of touchpad LED or series of LEDs.

VPCCMD_W_TOUCHPAD is nulled, it doesn't work.

I also checked which DSDTs I have (13 DSDTs from 2008 to this year)
contain TPEN, and turned out it was only S12, from 2009. It also had
nulled VPCCMD_W_TOUCHPAD, and returns TPEN on VPCCMD_R_TOUCHPAD, except
it doesn't have an LED or GL04.

So, it's possible that we can only check if TPEN exists on ACPI table,
instead of having a white-list.

-eray

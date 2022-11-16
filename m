Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12D3C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 16:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiKPQIf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 11:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiKPQIe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 11:08:34 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A8D13F6D
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 08:08:30 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d9so25964313wrm.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHZCGRQ2gIOBiFJ7IS1DjoDFcxvo6qnzlXU9FwRwr0I=;
        b=ELUdV+5n3C1TSA4XDUU9/rsv0aUF2O1h5X74rzlsjPutpg+HrWnXaOltsIKvxbBf/V
         Xr88lg4IdpKqJGAVkATbdvJzjeMrcCU77AWzXZ1ed4Ch5gP9pZ/kCHY+CwD7MTTtDBbf
         4YtWtjUHZVoHM6/DFlmbySafy6UZKQCAHJO+PR91u0dK3nfYSBEzl+AhoPNaik/5Rhkk
         zRqIcRK8yRPxxBn1INi2o3LkhtasiG5mqaZDopjlyPnCgrTSjc9pwV/KwPsCqGZ2gAQ6
         LgiyTTFU/FU00LnP9MVBDu/+vQCVYAezVlacPCHmT2dpFHi/maeJbIi+cARBmLe27FMP
         VA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHZCGRQ2gIOBiFJ7IS1DjoDFcxvo6qnzlXU9FwRwr0I=;
        b=ZjUhd9ajSNqgC4tWh5OSHBOGrLb9htYRYXnMG2xTVv5hXIJ+l9jVN14RnkazN7O8qv
         jmlqTnoad/w7DNR1FbPkqGw24W+xhCzlSX4ABIuBIA8E4qd8oLzcSkrMLe0imNFuA2UO
         mZkw2jTlzXXsV/c2GCsUSN3FKOBRm1WuKPjjkeUqWE5tnlA7JRJQupIPrqEDlHMwRJlY
         jBgYZ6sW+3mUpi8DwNpP9H37rOSIS5Bp+oFrt5j7UGGELbbN/Zejs2ndPTPjPRyf10qs
         v98DkjvPlCVVFMAZTmZrfd9vGrjZxiB2pWoBRZBB715owD8v9+O8my4ROz076JCAo+b/
         DrdA==
X-Gm-Message-State: ANoB5pn1m1v/9J9t2d/sfq7ZUY8+ZywDWp6zz694+fyxQ62lnZQPxx3g
        zIxnkZu7+SAiPa8j15WI0k0=
X-Google-Smtp-Source: AA0mqf4Tpzy6gKR4XaUiRtynyv+S2GxofrgiFOy2wpVQDGnH7wJAuMmcB3lCq0Fd/WjE4Gn1GkgsjA==
X-Received: by 2002:a5d:4910:0:b0:22e:589:4dd2 with SMTP id x16-20020a5d4910000000b0022e05894dd2mr13873101wrq.236.1668614908783;
        Wed, 16 Nov 2022 08:08:28 -0800 (PST)
Received: from eray-Lenovo-Z50-70.. ([188.132.247.187])
        by smtp.googlemail.com with ESMTPSA id j7-20020a5d4527000000b00236545edc91sm15562347wra.76.2022.11.16.08.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:08:28 -0800 (PST)
From:   =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>
To:     hdegoede@redhat.com
Cc:     andy@kernel.org, arnavr3@illinois.edu, erayorcunus@gmail.com,
        felix@eckhofer.com, g_goessel@outlook.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, kai.heng.feng@canonical.com,
        kelly@xilka.com, limanyi@uniontech.com, markgross@kernel.org,
        maxtram95@gmail.com, p.jungkamp@gmx.net,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com,
        whenov@gmail.com
Subject: Re: [PATCH 0/3] platform/x86: ideapad-laptop: Rework touchpad control code
Date:   Wed, 16 Nov 2022 19:08:25 +0300
Message-Id: <20221116160825.16120-1-erayorcunus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116152448.698707-1-hdegoede@redhat.com>
References: <20221116152448.698707-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Thu, 16 Nov 2022 at 18:25, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi All,
> 
> Here are my proposed changes from the "ideapad-laptop touchpad handling
> problems, request for help" email thread as proper patches:
> https://lore.kernel.org/platform-driver-x86/bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com/
> 
> Note this applies on top of my review-hans branch which has seen a bunch
> of other ideapad-laptop changes land recently:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> As suggested by Maxim, the third patch now has a module parameter to
> allow users to easily re-enable the i8042 aux-port enabling/disabling
> on models other then the Z570.
> 
> Eray, you mentioned in another email that you have some concerns about
> the approach in this series?

Yes, thanks for mentioning. My concerns are these:

- Users of laptops with ELAN0634 (like Yoga 14s and 720s), Lenovo
  Yoga 3 Pro 1370 and ZhaoYang K4e-IML will start to see non-working
  "touchpad" sysfs attribute on their ideapad-laptop driver. I see this
  as a regression. Also it's easy to fix; we can just test for if
  VPCCMD_W_TOUCHPAD works at the boot - with sending 0 first and verify the
  VPCCMD_R_TOUCHPAD result, and then sending 1 and again verify the
  VPCCMD_R_TOUCHPAD result. Later we can remove "touchpad" attribute if it
  doesn't work, with the exception of devices with ctrl_ps2_aux_port,
  since these laptops have working VPCCMD_R_TOUCHPAD.

- You removed sending 1 to VPCCMD_W_TOUCHPAD at the boot, are we sure
  there are no laptops needing that? I don't think we talked about that
  in previous e-mail thread.

- There is no i8042 cmd on touchpad_store, which may make the function
  ineffective on laptops with ctrl_ps2_aux_port.

- r_touchpad_val isn't set at touchpad_store and/or touchpad_read, which
  can make it out of sync when "touchpad" attr is accessed.

Best,
Eray

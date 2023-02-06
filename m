Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5E0C636D3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjBFPZl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBFPZl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:25:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169D329435
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675697094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UeRsUwXraH00cd2sE5Kq7ZYAcSvC5OMPd9fEpRmgyQk=;
        b=dR/Fwyt9nb9Kml0RRiNpZ7mWfPoVbOeAYUcD4bO78lwf/b5/YCBsHs3bfwBXBGuvmVsKts
        xcZwtoHDXSxbb1PaBwPSlL3aleFmhw84PrHYZW3z+gB3qMpzRla4D4Ig+XYvCmWMxZwe6q
        87VW+BPxzGYdBbSTa0DO7riCSHHbGkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-RJztv-YbNHGzSkzF7vckjg-1; Mon, 06 Feb 2023 10:24:51 -0500
X-MC-Unique: RJztv-YbNHGzSkzF7vckjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A01A1885627;
        Mon,  6 Feb 2023 15:24:49 +0000 (UTC)
Received: from plouf.local (ovpn-192-160.brq.redhat.com [10.40.192.160])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A5D9FC15BA0;
        Mon,  6 Feb 2023 15:24:45 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
        linux-staging@lists.linux.dev
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
Subject: Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
Message-Id: <167569708530.2863874.629972838322099394.b4-ty@redhat.com>
Date:   Mon, 06 Feb 2023 16:24:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 30 Jan 2023 03:59:36 +0000, Thomas Weißschuh wrote:
> Since 52d225346904 ("HID: Make lowlevel driver structs const") the
> lowlevel HID drivers are only exposed as const.
> 
> Take advantage of this to constify the underlying structures, too.
> 
> 

Applied to hid/hid.git (for-6.3/hid-core), thanks!

[1/9] HID: amd_sfh: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/65b7015bfe16
[2/9] HID: hyperv: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/d38213a911c5
[3/9] HID: logitech-dj: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/662eee8d46df
[4/9] HID: steam: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/ddb6792f0ef2
[5/9] HID: intel-ish-hid: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/3352c3e0bf9b
[6/9] HID: surface-hid: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/dd350afc1757
[7/9] platform/x86: asus-tf103c-dock: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/63509b149f1b
[8/9] platform/x86: asus-tf103c-dock: Constify toprow keymap
      https://git.kernel.org/hid/hid/c/783c3394b493
[9/9] staging: greybus: hid: Constify lowlevel HID driver
      https://git.kernel.org/hid/hid/c/ff17bb876014

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>


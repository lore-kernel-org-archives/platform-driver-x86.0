From: Corentin Chary <corentin.chary@gmail.com>
Subject: thinkpad-wmi
Date: Tue, 29 Sep 2015 15:51:16 +0200
Message-ID: <CAHR064j-m+THDoJjBG-g+=g8nHuWfMptJndjkwmT2Lw_54Vpuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37893 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965350AbbI2NvR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Sep 2015 09:51:17 -0400
Received: by wiclk2 with SMTP id lk2so17035678wic.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2015 06:51:16 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hello people interested in platform drivers,

I just implemented thinkpad-wmi which gives access to
http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy_en.pdf.
Some could argue that this should probably be done in userspace, but I
don't think we have a clean and secure way to expose WMI devices to
userspace yet.

The code is still living here: https://github.com/iksaif/thinkpad-wmi
and I will need to test it on a few models before sending it for
review, but feel free to test and look at it.

Thanks,

-- 
Corentin Chary
http://xf.iksaif.net

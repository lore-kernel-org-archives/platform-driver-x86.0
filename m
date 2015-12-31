From: Andy Lutomirski <luto@amacapital.net>
Subject: Heads up: dell-wmi bug
Date: Thu, 31 Dec 2015 04:31:03 -0800
Message-ID: <CALCETrUh6VPfwdCHAZyqcou4VQN4_xZuZ+St=gjhCB1aqPvuag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:32862 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbbLaMbX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Dec 2015 07:31:23 -0500
Received: by mail-ob0-f179.google.com with SMTP id bx1so169266217obb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Dec 2015 04:31:23 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

Hi-

I'm getting intermittent OOPSes when playing with dell-wmi.  I think
that find_hk_type function is buggy: it's saving a pointer to DMI
data, but you can't do that, because dmi_walk unmaps the data at the
end.  It probably works reliably on current kernels due to luck
(either a memory layout such that the unmap has no effect or deferred
vmap zapping).

If no one beats me to it, I'll fix this as part of the rebase work on
my big wmi series.

--Andy

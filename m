From: "Javier S. Pedro" <maemo@javispedro.com>
Subject: Re: Looking for some pointers on WMI/EC access
Date: Wed, 1 Dec 2010 01:16:15 +0100
Message-ID: <AANLkTimfj1QEqXWOp-Rc2KJZ6XdstkB_ct+P0zuQxVCa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60101 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049Ab0LAAQQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 19:16:16 -0500
Received: by iwn10 with SMTP id 10so370343iwn.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2010 16:16:16 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: floe@butterbrot.org, mjg59@srcf.ucam.org

(Rescuing old discussion about some IdeaPad S10-3t firmware weirdness,
where the front keys fire an EC event that is quietly consumed by
DSDT)

Florian Echtler (Thu, 22 Apr 2010 10:21:28 +0200):
> So it would be all joy and happiness if it weren't for the fact that
> ERQ0 is initialized to zero and is never changed anywhere else..

Just realized that a few lines below ERQ0 some bit fields are defined
(AP[0-7]) that are actually on the same address as the ERQ0 byte. This
makes
a lot of sense as AP[0-7] are written by WSIO (aka what wmi_set_block
calls here).

Just tried setting a random bit of AP* and events started flowing in. Thank you!

Javier.

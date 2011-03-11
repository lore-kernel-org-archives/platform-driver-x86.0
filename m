From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v2] Platform: Samsung Q10 backlight driver
Date: Fri, 11 Mar 2011 17:43:29 +0000
Message-ID: <20110311174329.GI16652@srcf.ucam.org>
References: <20110221223743.GA8548@lat.lan> <20110222052709.GA11681@core.coreip.homeip.net> <20110222212703.GA7292@lat.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33909 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751710Ab1CKRnh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Mar 2011 12:43:37 -0500
Content-Disposition: inline
In-Reply-To: <20110222212703.GA7292@lat.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Frederick van der Wyck <fvanderwyck@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@suse.de, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hm. This patch makes both git-am and patch very unhappy, in that they 
fail to create samsung-q10.c despite it not already existing. How did 
you generate it?

-- 
Matthew Garrett | mjg59@srcf.ucam.org

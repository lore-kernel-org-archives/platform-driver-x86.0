From: Jonathan Woithe <jwoithe@just42.net>
Subject: Whitespace cleanup proposal for fujitsu-laptop (was: Re: [PATCH]
 fujitsu-laptop: Add support for eco LED)
Date: Wed, 29 Jun 2016 09:02:11 +0930
Message-ID: <20160628233211.GA30332@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:55038 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752440AbcF1Xe5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 19:34:57 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org

Hi Darren

In the "Add support for eco LED" thread you noted:

> I was going to point out the checkpatch failures in codingstyle, but you
> were probably as consistent as you could be given the state of this driver
> and it's rather inconsistent use of whitespace.

It is true that there is inconsistency in this regard within this driver,
which has come about for various historical reasons.  Would you take a pure
whitespace cleanup patch if I were to go through the driver and fix these
issues as best they can be?

Regards
  jonathan

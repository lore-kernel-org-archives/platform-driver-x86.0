From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v5] thinkpad-acpi: Improve hardware volume controls
Date: Wed, 3 Aug 2011 00:30:40 -0300
Message-ID: <20110803033040.GA17685@khazad-dum.debian.net>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <20110614015808.GB27997@khazad-dum.debian.net>
 <BANLkTimwQavNth_+hemY8F6D0_feUTEqGg@mail.gmail.com>
 <20110723194024.GA29866@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:42644 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752918Ab1HCDan (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2011 23:30:43 -0400
Content-Disposition: inline
In-Reply-To: <20110723194024.GA29866@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

The patch breaks the driver on IBM thinkpads.  I have updated it for the
pr_foo macros, and I will fix it to do the right thing on older thinkpads so
that it won't cause the driver to abort probing :-)

Then, I will test it further.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

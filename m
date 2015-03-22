From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [patch 1/2] thinkpad_acpi: signedness bugs getting
 current_mode
Date: Sun, 22 Mar 2015 15:58:15 -0300
Message-ID: <1427050695.3946436.243707926.7D5B2C74@webmail.messagingengine.com>
References: <20150311093450.GA3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59308 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751813AbbCVS6Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 22 Mar 2015 14:58:16 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 4E11C2097D
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2015 14:58:13 -0400 (EDT)
In-Reply-To: <20150311093450.GA3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Wed, Mar 11, 2015, at 06:34, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes are
> small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

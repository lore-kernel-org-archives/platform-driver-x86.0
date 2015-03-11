From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [patch 2/2] thinkpad_acpi: off by one in
 adaptive_keyboard_hotkey_notify_hotkey()
Date: Wed, 11 Mar 2015 07:27:32 -0300
Message-ID: <1426069652.2792036.238809225.344CD11D@webmail.messagingengine.com>
References: <20150311093607.GB3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41995 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752432AbbCKK1f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Mar 2015 06:27:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6ED0C2091E
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2015 06:27:31 -0400 (EDT)
In-Reply-To: <20150311093607.GB3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015, at 06:36, Dan Carpenter wrote:
> +               if (scancode < FIRST_ADAPTIVE_KEY ||
> +                   scancode >= FIRST_ADAPTIVE_KEY +
> TPACPI_HOTKEY_MAP_LEN -
> +                               ADAPTIVE_KEY_OFFSET) {

Meh, I'd prefer that last linebreak to not be there, the 80-char rule is
meant to be ignored when it causes the code to be less readable.

That said,

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks for the fix!

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

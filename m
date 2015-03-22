From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [patch 2/2] thinkpad_acpi: off by one in
 adaptive_keyboard_hotkey_notify_hotkey()
Date: Sun, 22 Mar 2015 16:01:09 -0300
Message-ID: <1427050869.3946795.243708250.7D9CBED0@webmail.messagingengine.com>
References: <20150311093607.GB3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49177 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751874AbbCVTBK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 22 Mar 2015 15:01:10 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A7C8206E8
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2015 15:01:07 -0400 (EDT)
In-Reply-To: <20150311093607.GB3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Wed, Mar 11, 2015, at 06:36, Dan Carpenter wrote:
> This should be >= instead of > because otherwise we read one element
> past the end of the hotkey_keycode_map[] array.
> 
> The hotkey_keycode_map[] array has TPACPI_HOTKEY_MAP_LEN elements.
> 
> Fixes: 6a68d8557084 ('thinkpad_acpi: Add support for more adaptive kbd
> buttons')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>


-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

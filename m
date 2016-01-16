From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] Remove logging for "Unsupported brightness interface"
Date: Sat, 16 Jan 2016 21:21:31 -0200
Message-ID: <1452986491.4074942.494113586.2EC42546@webmail.messagingengine.com>
References: <CANpvso7bPLEsxnv6pORJS6mPwf809um08tA7u5dPAzpxSNOFRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34864 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752842AbcAPXVe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 16 Jan 2016 18:21:34 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 81927200C9
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2016 18:21:31 -0500 (EST)
In-Reply-To: <CANpvso7bPLEsxnv6pORJS6mPwf809um08tA7u5dPAzpxSNOFRw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Kernel development list <linux-kernel@vger.kernel.org>


On Sat, Jan 16, 2016, at 20:48, Eric Curtin wrote:
> Message gets logged on machines that are well supported. Fixed one
> checkpatch.pl ERROR and ran the file through checkpatch.pl --fix to fix
> other
> problems and reviewed the changes the script made.

Nack.  Please resubmit without the checkpatch --fix changes.



-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

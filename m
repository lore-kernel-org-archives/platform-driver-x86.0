From: Kevin Locke <kevin@kevinlocke.name>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add support for keyboard
 backlight
Date: Tue, 12 Jan 2016 10:36:47 -0800
Message-ID: <569547BF.3030104@kevinlocke.name>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali> <20160111211228.GA4171@sig21.net>
 <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
 <569541B4.1020905@kevinlocke.name>
 <1452622815.408163.490114450.23398941@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from praxis.kevinlocke.name ([205.185.125.39]:60453 "EHLO
	praxis.kevinlocke.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbcALSgu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 13:36:50 -0500
In-Reply-To: <1452622815.408163.490114450.23398941@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net
Cc: Johannes Stezenbach <js@sig21.net>, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>, platform-driver-x86@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>

On 01/12/2016 10:20 AM, Henrique de Moraes Holschuh wrote:
> On Tue, Jan 12, 2016, at 16:11, Kevin Locke wrote:
>> I looked through the DSDT and SSDT AML on the T430 (which also has both
>> a keyboard backlight and ThinkLight) and couldn't deduce which method
>> was being invoked for Fn+Space or an analog to MLCG/MLCS for the
>> ThinkLight.  However, that may be due to my inexperience interpreting
>> AML.  I'll keep looking/learning.
>
> It calls directly into the SMBIOS :-(

Bummer!  Thank you for taking the time to figure that out.

Kevin

From: =?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozan@pardus.org.tr>
Subject: Re: Common boot/shutdown issues with the latest 2.6.37 (Mostly Asus
 laptops)
Date: Mon, 31 Jan 2011 20:29:22 +0200
Message-ID: <4D46FF82.1090704@pardus.org.tr>
References: <556624.21214.qm@web28409.mail.ukl.yahoo.com> <201101311123.14704.rjw@sisk.pl> <4D468F1F.8030704@t-online.de> <201101311924.33098.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lider.pardus.org.tr ([193.140.100.216]:50893 "EHLO
	lider.pardus.org.tr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755782Ab1AaS3X (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 31 Jan 2011 13:29:23 -0500
In-Reply-To: <201101311924.33098.rjw@sisk.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?B?UmljaGFyZCBTY2jDvHR6?= <r.schtz@t-online.de>, Lionel Debroux <lionel_debroux@yahoo.fr>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, colin.king@canonical.com

On 31.01.2011 20:24, Rafael J. Wysocki wrote:

>>
>> Or just use the processor.max_cstate parameter then.
>
> As I wrote a couple of messages ago, https://lkml.org/lkml/2011/1/31/52 .

The users reported that processor.max_cstate=0 didn't help too. The ones 
which experience random hangs during shutdown tells that the hard disk 
is turned off and the fans are turning faster.

The other user which can't even boot didn't tell the result of adding 
processor.max_cstate=0 to boot params.


-- 
Pardus Linux
http://www.pardus.org.tr/eng

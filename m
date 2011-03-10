From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Thu, 10 Mar 2011 19:28:00 +0200
Message-ID: <4D790A20.3050105@gmail.com>
References: <20110209224006.GA11202@kroah.com> <AANLkTikrr6Gu_qoq73ASC95E0HQC1p6KzDPLxo=J_rva@mail.gmail.com> <20110225210334.GB16860@kroah.com> <4D6823DD.6040809@gmail.com> <20110225225055.GA5931@kroah.com> <4D787714.6060405@gmail.com> <20110310170143.GA24559@kroah.com> <AANLkTinyqJx76=nzepa9fe5VDzqiXRGCQ=E1SsKm2npE@mail.gmail.com> <20110310171940.GA24972@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090501010303020304060507"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:59880 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753620Ab1CJR2F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Mar 2011 12:28:05 -0500
In-Reply-To: <20110310171940.GA24972@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------090501010303020304060507
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2011 07:19 PM, Greg KH wrote:
> Can you provide me the output of:
> 	grep . /sys/class/dmi/id/*
> so I can try to add support for this machine to the driver?
Sure, here it is.

Sincerely,
Nick

--------------090501010303020304060507
Content-Type: text/plain;
 name="n230_dmi_id_grep.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="n230_dmi_id_grep.txt"

L3N5cy9jbGFzcy9kbWkvaWQvYmlvc19kYXRlOjA1LzE4LzIwMTAKL3N5cy9jbGFzcy9kbWkv
aWQvYmlvc192ZW5kb3I6UGhvZW5peCBUZWNobm9sb2dpZXMgTHRkLgovc3lzL2NsYXNzL2Rt
aS9pZC9iaW9zX3ZlcnNpb246MDBNQS5NMDAwLjIwMTAwNTE4LkpJUAovc3lzL2NsYXNzL2Rt
aS9pZC9ib2FyZF9hc3NldF90YWc6U0FNU1VORwovc3lzL2NsYXNzL2RtaS9pZC9ib2FyZF9u
YW1lOk4yMzAgICAgICAgICAgICAgICAgICAgICAgIAovc3lzL2NsYXNzL2RtaS9pZC9ib2Fy
ZF9zZXJpYWw6MTIzNDkwRU40MDAwMTUKL3N5cy9jbGFzcy9kbWkvaWQvYm9hcmRfdmVuZG9y
OlNBTVNVTkcgRUxFQ1RST05JQ1MgQ08uLCBMVEQuCi9zeXMvY2xhc3MvZG1pL2lkL2JvYXJk
X3ZlcnNpb246Tm90IEFwcGxpY2FibGUKL3N5cy9jbGFzcy9kbWkvaWQvY2hhc3Npc19hc3Nl
dF90YWc6Tm8gQXNzZXQgVGFnCi9zeXMvY2xhc3MvZG1pL2lkL2NoYXNzaXNfc2VyaWFsOk5v
bmUgICAgICAgIAovc3lzL2NsYXNzL2RtaS9pZC9jaGFzc2lzX3R5cGU6MTAKL3N5cy9jbGFz
cy9kbWkvaWQvY2hhc3Npc192ZW5kb3I6U0FNU1VORyBFTEVDVFJPTklDUyBDTy4sIExURC4K
L3N5cy9jbGFzcy9kbWkvaWQvY2hhc3Npc192ZXJzaW9uOk4vQSAgICAgICAgIAovc3lzL2Ns
YXNzL2RtaS9pZC9tb2RhbGlhczpkbWk6YnZuUGhvZW5peFRlY2hub2xvZ2llc0x0ZC46YnZy
MDBNQS5NMDAwLjIwMTAwNTE4LkpJUDpiZDA1LzE4LzIwMTA6c3ZuU0FNU1VOR0VMRUNUUk9O
SUNTQ08uLExURC46cG5OMjMwOnB2ck5vdEFwcGxpY2FibGU6cnZuU0FNU1VOR0VMRUNUUk9O
SUNTQ08uLExURC46cm5OMjMwOnJ2ck5vdEFwcGxpY2FibGU6Y3ZuU0FNU1VOR0VMRUNUUk9O
SUNTQ08uLExURC46Y3QxMDpjdnJOL0E6Ci9zeXMvY2xhc3MvZG1pL2lkL3Byb2R1Y3RfbmFt
ZTpOMjMwICAgICAgICAgICAgICAgICAgICAgICAKL3N5cy9jbGFzcy9kbWkvaWQvcHJvZHVj
dF9zZXJpYWw6WlQ3SDkzSFo4MDAxOTQKL3N5cy9jbGFzcy9kbWkvaWQvcHJvZHVjdF91dWlk
OjAwMENEQkQxLUUzMUQtQjIxMS04MDAwLTkyQkMzNzUzOTdEQQovc3lzL2NsYXNzL2RtaS9p
ZC9wcm9kdWN0X3ZlcnNpb246Tm90IEFwcGxpY2FibGUKL3N5cy9jbGFzcy9kbWkvaWQvc3lz
X3ZlbmRvcjpTQU1TVU5HIEVMRUNUUk9OSUNTIENPLiwgTFRELgovc3lzL2NsYXNzL2RtaS9p
ZC91ZXZlbnQ6TU9EQUxJQVM9ZG1pOmJ2blBob2VuaXhUZWNobm9sb2dpZXNMdGQuOmJ2cjAw
TUEuTTAwMC4yMDEwMDUxOC5KSVA6YmQwNS8xOC8yMDEwOnN2blNBTVNVTkdFTEVDVFJPTklD
U0NPLixMVEQuOnBuTjIzMDpwdnJOb3RBcHBsaWNhYmxlOnJ2blNBTVNVTkdFTEVDVFJPTklD
U0NPLixMVEQuOnJuTjIzMDpydnJOb3RBcHBsaWNhYmxlOmN2blNBTVNVTkdFTEVDVFJPTklD
U0NPLixMVEQuOmN0MTA6Y3ZyTi9BOgo=
--------------090501010303020304060507--

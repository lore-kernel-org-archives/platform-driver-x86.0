From: Javier Aguinaga <javier.4guinaga@gmail.com>
Subject: firmware reverse code engineering
Date: Wed, 16 Mar 2016 15:35:56 -0300
Message-ID: <CACWXQrZiLsSen2c5n1Oe_yEp66+ZVGA8+NJEtVEsE8CQ+f==Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f175.google.com ([209.85.161.175]:35730 "EHLO
	mail-yw0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934328AbcCPSf4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Mar 2016 14:35:56 -0400
Received: by mail-yw0-f175.google.com with SMTP id g127so72694858ywf.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2016 11:35:56 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi everbody, I'm new in the list

I want to make a research about the non-free wifi modules
(iwlwifi-3160-8.ucode), but I am really lost

I was thinking  that this modules could be ELF binaries, but the magic
number says another thing:

writer@polluelo:/lib/firmware$ hexdump -C iwlwifi-3160-8.ucode | head -20
00000000  00 00 00 00 49 57 4c 0a  62 61 73 65 6c 69 6e 65  |....IWL.baseline|
00000010  3a 4c 69 6e 75 78 5f 73  74 61 62 5f 43 6f 72 65  |:Linux_stab_Core|
00000020  43 79 63 6c 65 34 5f 32  35 00 00 00 00 00 00 00  |Cycle4_25.......|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000040  00 00 00 00 00 00 00 00  00 08 18 16 00 00 00 00  |................|
00000050  00 00 00 00 00 00 00 00  06 00 00 00 04 00 00 00  |................|
00000060

Is there a way to analize the assembler of this module?

I looked in Google but I can't find anything

Thanks in advance

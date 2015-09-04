From: Samuel Sieb <samuel@sieb.net>
Subject: acer-wmi doesn't work with new Acer Aspire ES 15 models
Date: Fri, 4 Sep 2015 15:54:56 -0700
Message-ID: <55EA2140.80403@sieb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-out-no.shaw.ca ([64.59.134.13]:52400 "EHLO
	smtp-out-no.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933961AbbIDXDM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Sep 2015 19:03:12 -0400
Received: from [192.168.53.1] (unknown [24.69.201.142])
	by gw.sieb.net (Postfix) with ESMTPSA id 840622031E
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2015 15:55:01 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I just bought a few new Acer Aspire ES 15 laptops of two different 
models.  Both models are ES1-521-* and I found a posting of someone else 
having the same problem with a similar model number.

For searching purposes, the exact model numbers are:
ES1-521-46IE
ES1-521-82FG
ES1-521-88R9 (from https://ubuntu-mate.community forums)

The issue is that if the acer-wmi module is loaded, the wifi rfkill is 
hard blocked.  Also, none of the keys that the module claims to provide 
do anything.  E.g. the wifi toggle and screen switch keys don't actually 
send a key press or do anything else.  If I blacklist the module, then 
the wifi works fine (and the keys still don't have any effect).

I will have access to these laptops for the next week and intermittently 
after that if there's anything I could do to help solve this.

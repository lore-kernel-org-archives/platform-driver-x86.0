From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Fix for acer-wmi incorrectly loading on Thinkpad E520
Date: Thu, 27 Oct 2011 10:32:51 -0500
Message-ID: <4EA979A3.9030605@lwfinger.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:36800 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752480Ab1J0Pce (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Oct 2011 11:32:34 -0400
Received: by ywm3 with SMTP id 3so2744938ywm.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2011 08:32:33 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

Joey,

Is the patch to blacklist the loading of acer-wmi on Thinkpad E520 queued up for 
3.2? It is affecting at least one openSUSE 12.1 user (bnc#725955) and I would 
like to get the patch into the openSUSE kernel before 12.1 is released.

Thanks,

Larry

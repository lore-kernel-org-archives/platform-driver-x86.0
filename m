From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G device when set capability
Date: Mon, 23 May 2011 19:54:19 +0100
Message-ID: <201105231954.19779.carlos@strangeworlds.co.uk>
References: <1306020834-5186-1-git-send-email-jlee@novell.com> <201105230741.44906.carlos@strangeworlds.co.uk> <4DDA9A56020000230002CF5E@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:47116 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756801Ab1EWSyw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2011 14:54:52 -0400
Received: by wya21 with SMTP id 21so4438904wya.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 May 2011 11:54:51 -0700 (PDT)
In-Reply-To: <4DDA9A56020000230002CF5E@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: corentin.chary@gmail.com, dtor@mail.ru, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

On Monday 23 May 2011 08:33:10 Joey Lee wrote:
> After removed threeg sysfs file, there still have the latest one sysfs
> file the name is "interface". It provide a interface to know which WMI
> interface was used currently.
> 
> Should we also direct drop it from acer-wmi or move to debugfs?

I'd say drop it, the logs are more useful anyway and I doubt it's been updated 
to be useful with your recent work either.

-Carlos

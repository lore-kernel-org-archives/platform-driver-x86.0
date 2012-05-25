From: =?KOI8-U?B?7cHL08nNIO3Jy8nU0c7Ty8nK?= <maxtram95@gmail.com>
Subject: Re: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Fri, 25 May 2012 13:19:21 +0300
Message-ID: <CAKErNvo4CnhRx8ZAOL5cUrDJ33r6cpuYq1jd2QC5v0GmyJ=nig@mail.gmail.com>
References: <CAKErNvpb==5=__rxjPeP24Oo1SxTBKPdR3TKLmGmHrr3e+xhDQ@mail.gmail.com>
 <4FBB1057.1050108@canonical.com> <CAKErNvpwASnFkMBJ-y_p73t5uS6gaWGCqy4Qbem3OSY8Lrfnrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:42664 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752904Ab2EYKTm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 May 2012 06:19:42 -0400
Received: by gglu4 with SMTP id u4so676157ggl.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 May 2012 03:19:42 -0700 (PDT)
In-Reply-To: <CAKErNvpwASnFkMBJ-y_p73t5uS6gaWGCqy4Qbem3OSY8Lrfnrg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

>+               supported = !read_ec_cmd(ideapad_handle, VPCCMD_R_FAN, &value);

I'm sorry, there is a typo, this line should look like this:

+               supported = !read_ec_data(ideapad_handle, VPCCMD_R_FAN, &value);

Here is the latest version of the patch: http://paste.ubuntu.com/1006185/
Didn't send it in letter body, because it's mostly the same as previous.

So what about the patch?

From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] platform: add chrome platform directory
Date: Fri, 8 Nov 2013 10:22:36 -0800
Message-ID: <CANLzEktOccLaQGwO2V43eTMT=dZhytuNvo6FzD6W41Zf9E-YGg@mail.gmail.com>
References: <1383863145-8826-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:52543 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932155Ab3KHSWh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Nov 2013 13:22:37 -0500
Received: by mail-ve0-f178.google.com with SMTP id db12so1748856veb.37
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Nov 2013 10:22:36 -0800 (PST)
In-Reply-To: <1383863145-8826-1-git-send-email-olof@lixom.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Thu, Nov 7, 2013 at 2:25 PM, Olof Johansson <olof@lixom.net> wrote:
> It makes sense to split out the Chromebook/Chromebox hardware platform
> drivers to a separate subdirectory, since some of it will be shared
> between ARM and x86.
>
> This moves over the existing chromeos_laptop driver without making
> any other changes, and adds appropriate Kconfig entries for the new
> directory. It also adds a MAINTAINERS entry for the new subdir.
>
> Signed-off-by: Olof Johansson <olof@lixom.net>

Reviewed-by: Benson Leung <bleung@chromium.org>


-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org

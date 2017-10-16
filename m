From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
Date: Mon, 16 Oct 2017 09:33:07 +0200
Message-ID: <20171016073307.ahdc6ogzytzwckpq@pali>
References: <cover.1507958847.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33659 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbdJPHdJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Oct 2017 03:33:09 -0400
Content-Disposition: inline
In-Reply-To: <cover.1507958847.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

Hi! Just a small idea, what about including example userspace
application which would use this new API? I think such application can
be useful for documentation purpose to see how this new API should be
used. And in review process other people can point if there would be
some problems with usage.

I do not know if it is requirement or not for introducing new kernel
API, but still example code is very useful for developers when they
would start to use this new API and correctly.

-- 
Pali Rohár
pali.rohar@gmail.com

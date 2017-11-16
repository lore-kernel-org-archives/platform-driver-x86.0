From: valdis.kletnieks@vt.edu
Subject: Re: [PATCH] platform/x86: dell-laptop: Allocate buffer before rfkill use
Date: Wed, 15 Nov 2017 22:55:07 -0500
Message-ID: <40135.1510804507@turing-police.cc.vt.edu>
References: <1510777273-31322-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1510777273-31322-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 15 Nov 2017 14:21:13 -0600, Mario Limonciello said:
> On machines using rfkill interface the buffer needs to have been
> allocated before the initial use (memset) of it.
>
> Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Works here, thanks.  Feel free to stick a Tested-By: on it ;)

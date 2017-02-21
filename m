From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] asus-wireless: Toggle airplane mode LED
Date: Tue, 21 Feb 2017 16:27:12 +0300
Message-ID: <20170221132712.GA5978@mwanda>
References: <20170218203059.GA23566@mwanda>
 <CA+A7VXX-ST1GgeSU6JJ_Wu8BWFqVz66gg6Wshm71agFHbjuVgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:21811 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752634AbdBUN12 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2017 08:27:28 -0500
Content-Disposition: inline
In-Reply-To: <CA+A7VXX-ST1GgeSU6JJ_Wu8BWFqVz66gg6Wshm71agFHbjuVgA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

On Mon, Feb 20, 2017 at 02:22:38PM -0500, João Paulo Rechi Vita wrote:
> Hello Dan,
> 
> On 18 February 2017 at 15:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Hello João Paulo Rechi Vita,
> >
> > The patch 2c1a49c96123: "asus-wireless: Toggle airplane mode LED"
> > from Jun 13, 2016, leads to the following static checker warning:
> >
> >         drivers/platform/x86/asus-wireless.c:54 asus_wireless_method()
> >         error: uninitialized symbol 'ret'.
> >
> 
> I believe I have a fix for this, but I'm not able to reproduce this
> message with neither of the following:
> 
> make C=2 CHECK="/usr/bin/sparse" drivers/platform/x86/asus-wireless.o
> make C=2 CHECK="../smatch/smatch -p=kernel" drivers/platform/x86/asus-wireless.o
> make C=2 CHECK="scripts/coccicheck" drivers/platform/x86/asus-wireless.o
> 
> So I am not able to check the fix. How can I reproduce this?
> 

It's some unpublished Smatch stuff...  I still have too many false
positives.

regards,
dan carpenter

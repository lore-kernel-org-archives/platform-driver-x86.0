From: Darren Hart <dvhart@infradead.org>
Subject: Re: Supporting status LEDs in acer-wmi
Date: Wed, 12 Apr 2017 16:56:32 -0700
Message-ID: <20170412235632.GB11963@fury>
References: <CA+A7VXXd5mvMVJCzrz-oecS6jFdD7G4C=TxkEcH_SkxWvNWXiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:38757 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754721AbdDLX4g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2017 19:56:36 -0400
Content-Disposition: inline
In-Reply-To: <CA+A7VXXd5mvMVJCzrz-oecS6jFdD7G4C=TxkEcH_SkxWvNWXiw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux@endlessm.com, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Tue, Apr 11, 2017 at 03:31:34PM -0400, João Paulo Rechi Vita wrote:
> Hello,
> 
> I'm working to support the status LEDs embedded in the "mic mute" and
> "radio toggle" buttons on a Acer TravelMate P648-G2-MG laptop, but
> can't quite get how these are controlled. I have traced the ACPI
> execution from Windows for both buttons, and tried to compare with a
> method tracing on Linux, but couldn't get much out of it.
> 
> For the mic mute button, I see _Q45, WMID._WED, WMID.EVBC and
> WMID.CLBC being called on both platforms. For the radios button, I see
> WMID.WMAA and WMID.WSMI on both platforms as well. Only on windows the
> LEDs change status when the buttons are pressed, on Linux the LEDs are
> always on.
> 
> I'm attaching the acpidump and the Windows traces, in case you guys
> have any suggestion on what should I try to poke at.

We would need to compare the input buffers used in each case for those WMI
methods. If you can find the MOF data, you may be able to get a better idea of
what those methods are expecting as input. Not something I've done myself, but
there are a few tools out there to extract the MOF data, and you can readily
find tutorials on how to use that data from within Windows.

For example:
http://blog.nietrzeba.pl/2011/12/mof-decompilation.html


-- 
Darren Hart
VMware Open Source Technology Center

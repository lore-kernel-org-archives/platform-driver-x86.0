From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Wireless key on Fujitsu E753 not working since
 a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Tue, 13 Aug 2013 00:12:12 +0930
Message-ID: <20130812144212.GA20923@marvin.atrad.com.au>
References: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
 <CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:51336 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756228Ab3HLOzm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Aug 2013 10:55:42 -0400
Content-Disposition: inline
In-Reply-To: <CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jwoithe@just42.net

> 2013/6/28 Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>:
> > since commit "a57f7f9175b8ccbc9df83ac13860488913115de4" (bisected) the
> > wireless key on my Fujitsu E753 is not working any more. If I boot up
> > with parameter "acpi_osi="!Windows 2012"" it works, though.
> > I filed an ACPI-bug
> > (https://bugzilla.kernel.org/show_bug.cgi?id=60161), but was told
> > (https://bugzilla.kernel.org/show_bug.cgi?id=60161#c5) that this is
> > caused by the fujitsu_laptop driver. So I report it here. Should I
> > file a bug anywhere or is it enough to write it to the list?

Does this "wireless key" do what you expect if the fujitsu_laptop module is
not loaded?

I know nothing about the E753.  Is the "wireless key" a dedicated key on the
keyboard, a separate switch, or something entirely different?  It sounds
like it's just an enable switch.

jonathan

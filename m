From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Tue, 10 Oct 2017 20:40:35 +0100
Message-ID: <20171010204035.1b827bfe@alans-desktop>
References: <cover.1507156392.git.mario.limonciello@dell.com>
        <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
        <20171005145911.06a5644c@alans-desktop>
        <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
        <20171005154445.GC29347@kroah.com>
        <20171005155619.GA10938@pali>
        <20171005162810.GB4993@kroah.com>
        <9b58d0a8796948f39776d6bb38bcb9d6@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.llwyncelyn.cymru ([82.70.14.225]:40946 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753878AbdJJTlT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 15:41:19 -0400
In-Reply-To: <9b58d0a8796948f39776d6bb38bcb9d6@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: gregkh@linuxfoundation.org, pali.rohar@gmail.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> There are some "write once" items that for the general purpose user that
> won't brick a box, but should probably be blacklisted though.
> I'll think this through some more.

I would strongly urge you to do whitelisting as it's good security. If
you can divide the calls into something like this it fits the Linxu
desktop model well:

Safe -> anyone can do it
Console -> only console owner
Superuser -> administrator level (things that can be irritating but
don't persist a reboot)

Beyond that it's trickier - if you are an enterprise business then you
don't for example want to allow someone with root on the system to
subvert BIOS level settings they can't access.

You need a minimum of CAP_SYS_RAWIO for anything that can (through bugs
or design) subvert secure boot type stuff. It's also probably an
appropriate check for 'anything goes' if you decide to have that
category. CAP_SYS_RAWIO implies total power over the machine although
with secureboot it's less clear.

Alan

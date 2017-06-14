From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Subject: Re: WMI and Kernel:User interface
Date: Wed, 14 Jun 2017 02:28:06 +0200
Message-ID: <1497400086.10316.48.camel@petrovitsch.priv.at>
References: <20170509231639.GB11404@fury>
         <20170613070535.GA13252@infradead.org> <20170613153857.GC27850@fury>
         <201706131916.12144@pali> <20170613174027.GL27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613174027.GL27850@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2017-06-13 at 10:40 -0700, Darren Hart wrote:
[...]
> There are plenty of other examples of things you can do to screw up the
> state of your system if you have the right permissions for which the
> answer is "don't do that". Consider MEM(4), SETPCI(8), ... /dev/sda ...
> for example.

So what is the problem?!
And that pretty much answers it for the Unix world IMHO (FWIW) ...

And there is *a lot* more of that if you are root.
WTF - that actually is the job definition of root/administrator/
supervisor/... to be able to fix (almost) everything and that implies
practically the rights to be able to do everything.

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

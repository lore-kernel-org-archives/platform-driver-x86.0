From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
 x86-laptop-drivers.txt to reST
Date: Thu, 20 Jun 2019 09:19:25 +0300
Message-ID: <CAHp75Vf__EtLVTOf0XvA3w7RPj+bnoQOud3gCXr1Fya0b_o4cw@mail.gmail.com>
References: <20190618053227.31678-1-puranjay12@gmail.com> <20190618054158.GA3713@kroah.com>
 <20190618071717.2132a1b7@lwn.net> <20190618133948.GB5416@kroah.com> <8aeb222a-ee44-4125-45fd-ce9a741e7ecc@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8aeb222a-ee44-4125-45fd-ce9a741e7ecc@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Puranjay Mohan <puranjay12@gmail.com>, Linux Documentation List <linux-doc@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 18, 2019 at 6:06 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
> On 6/18/19 7:39 AM, Greg KH wrote:
> > On Tue, Jun 18, 2019 at 07:17:17AM -0600, Jonathan Corbet wrote:
> >> On Tue, 18 Jun 2019 07:41:58 +0200
> >> Greg KH <gregkh@linuxfoundation.org> wrote:
> >>> On Tue, Jun 18, 2019 at 11:02:27AM +0530, Puranjay Mohan wrote:

> > I bet it should be deleted, but we should ask the platform driver
> > maintainers first before we do that :)

> Adding Platform driver maintainers Darren Hart and Andy Shevchenko, and
> Compal laptop maintainer Cezary Jackiewicz to the discussion.
>
> + platform-driver-x86@vger.kernel.org
>
> Hi Darren, Andy, and Cezary,
>
> Would it be okay to remove the x86-laptop-drivers.txt or should it be
> converted to .rst and kept around?

Shuan, thanks for heads up.
The list of laptops supported by drivers in PDx86 subsystem is quite
big and growing. The mentioned file contains less than per cent out of
it and I don't think there is sense to make it up to date with
thousands lines. Agree on removal.

-- 
With Best Regards,
Andy Shevchenko

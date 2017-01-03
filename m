From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v2] acer-wmi: setup accelerometer when machine has
 appropriate notify event
Date: Tue, 3 Jan 2017 08:16:51 +0800
Message-ID: <20170103001651.GA8823@linux-l9pv.suse>
References: <1478132332-25284-1-git-send-email-jlee@suse.com>
 <CAHp75VfJi_1LaPmE=Gxz_H-AcWqHnSRSGJgdA=GpZtUQwOs91Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfJi_1LaPmE=Gxz_H-AcWqHnSRSGJgdA=GpZtUQwOs91Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 27, 2016 at 02:00:01PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 3, 2016 at 2:18 AM, Lee, Chun-Yi <joeyli.kernel@gmail.com> wrote:
> > The accelerometer event relies on on the ACERWMID_EVENT_GUID notify.
> > So, this patch changes the codes to setup accelerometer input device
> > when detected ACERWMID_EVENT_GUID. It avoids that the accel input
> > device created on every acer machines.
> >
> > In addition, patch adds a clearly parsing logic of accelerometer hid
> > to acer_wmi_get_handle_cb callback function. It is positive matching
> > the "SENR" name with "BST0001" device to avoid non-supported hardware.
> >
> 
> Pushed to testing with slightly massaged commit message.
> Thanks.
> 

Thanks a lot!
Joey Lee

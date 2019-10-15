From: ayman.bagabas@gmail.com
Subject: Re: [PATCH] platform/x86: huawei-wmi: make validation stricter in
 huawei_wmi_battery_set()
Date: Tue, 15 Oct 2019 09:20:35 -0400
Message-ID: <4eaef0a107796895fc59989d1481676f794fcac5.camel@gmail.com>
References: <20191015083837.GA29104@mwanda>
         <CAB3uXr63uUwxBjkeeoftZ6HYm_hmN+E5EUhu15_Mta2qruOugA@mail.gmail.com>
         <20191015124623.GF21344@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015124623.GF21344@kadam>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Takashi Iwai <tiwai@suse.de>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2019-10-15 at 15:46 +0300, Dan Carpenter wrote:
> On Tue, Oct 15, 2019 at 08:21:59AM -0400, Ayman Bagabas wrote:
> > Hi Dan
> > 
> > On Tue, Oct 15, 2019, 4:39 AM Dan Carpenter <
> > dan.carpenter@oracle.com>
> > wrote:
> > 
> > > I don't think it makes sense for "end" to be negative or for even
> > > for it
> > > to be less than "start".  That also means that "start" can't be
> > > more
> > > than 100 which is good.
> > > 
> > 
> > While this makes sense, you run into issues where you cannot set
> > "start"
> > before "end" and vice versa.
> > 
> > Take this scenario, you have start=70 and end=90, now you want to
> > set these
> > to start=40 and end=60, you would have to set "start" first before
> > you can
> > change the value of "end" otherwise you will run into EINVAL. Now
> > imagine
> > you wanna go the opposite direction, you would have to set "end"
> > before you
> > can change "start".
> > I think having a little wiggle room is fine for such scenarios.
> > 
> 
> I haven't tested this code...  What you're describing sounds really
> very weird to me, but I will accept that you know more about your
> use cases than I do.
> 
> My other concern is that right now you can set start > 100 or end <
> 0.

We should check for these cases.

> 
> regards,
> dan carpenter
> 

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Expose conservation
 mode switch
Date: Tue, 15 Aug 2017 15:42:50 -0700
Message-ID: <20170815224250.GA28337@fury>
References: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg>
 <CAHp75Vc8r0YWUZ77+nFmwn5_Yz7XqhJ5C+qRcjemmtmK+=YXXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57803 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751848AbdHOWmx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2017 18:42:53 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vc8r0YWUZ77+nFmwn5_Yz7XqhJ5C+qRcjemmtmK+=YXXA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hao Wei Tee <angelsl@in04.sg>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Mon, Aug 14, 2017 at 06:32:48PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 14, 2017 at 5:17 PM, Hao Wei Tee <angelsl@in04.sg> wrote:
> > +static int method_gbmd(acpi_handle handle, unsigned long *ret)
> > +{
> > +       int val;
> > +       int result = read_method_int(handle, "GBMD", &val);
> 
> Reversed X-mas tree order in new code, please.

Generally yes, but of here they are using &val in the second initializer.

So either as is or:

int result;
int val;

result = read_method_int(handle, "GBMD", &val)

I tend to accept it as is when there is a declaration order dependency like
this.

-- 
Darren Hart
VMware Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
Date: Wed, 4 Oct 2017 19:49:47 -0700
Message-ID: <20171005024947.GJ25018@fury>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
 <CAHp75VcWfzEiZAt+ESoF==q0LnCgWRzBuo6FDizmSJ7V-8Rw3w@mail.gmail.com>
 <CAHR064i+x=MeuHxTfDNRUr1C_p2dW8+nORqtGQUcYE4Dcbyppg@mail.gmail.com>
 <CAHR064jrkntSf8_5kiL5x8B+_BwCHrrZajgedYe-FNt439wDpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42946 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751220AbdJECtt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 22:49:49 -0400
Content-Disposition: inline
In-Reply-To: <CAHR064jrkntSf8_5kiL5x8B+_BwCHrrZajgedYe-FNt439wDpA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 05, 2017 at 09:07:27AM +0200, Corentin Chary wrote:
> [re-send for the mailing list, I forgot that gmail was stupid]
> 
> On Tue, Sep 5, 2017 at 9:05 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
> >>
> >> I didn't read the code, does it use WMI bus which Andy L. introduced
> >> recently?
> >>
> >
> > No, I wasn't aware of it. I checked the dell-wmi conversion patch and it
> > should not be too hard.
> > I'll probably sent that as a patch on top the existing driver (in the same
> > series).

Hi Corentin,

Just to make sure I haven't missed it - I believe we're waiting for a v2 of this
patch. Is that right?

-- 
Darren Hart
VMware Open Source Technology Center

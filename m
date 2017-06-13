From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: wmi: Fix printing info about WDG
 structure
Date: Tue, 13 Jun 2017 09:52:55 -0700
Message-ID: <20170613165255.GJ27850@fury>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <1497092231-505-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75VfyPe=sXU_GCRcM_mqr7W8=Bp4Va0qxv61TyhOMp+0uVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfyPe=sXU_GCRcM_mqr7W8=Bp4Va0qxv61TyhOMp+0uVA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Joe Perches <joe@perches.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 10, 2017 at 02:22:50PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 10, 2017 at 1:57 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > object_id and notify_id are in one union structure and their meaning is
> > defined by flags. Therefore do not print notify_id for non-event block and
> > do not print object_id for event block. Remove also reserved member as it
> > does not have any defined meaning or type yet.
> >
> > As object_id and notify_id union members overlaps and have different types,
> > it caused that kernel print to dmesg binary data. This patch eliminates it.
> >
> > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks Pali, nice fix. Queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center

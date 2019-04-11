From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v13] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Thu, 11 Apr 2019 17:13:27 +0300
Message-ID: <CAHp75Vfqi4Z3OrMsgeTJamJ61b7urAGkU2CKng8+Y-HvOGTvBQ@mail.gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1554406595-3128-1-git-send-email-lsun@mellanox.com> <CAHp75VdUwn1NEpSc0_Oc4wEh0TRzCwcE0_tajg3ak8BjfZ_-Mw@mail.gmail.com>
 <DB6PR05MB3223779DDDF815D2F5AFFE6BA1510@DB6PR05MB3223.eurprd05.prod.outlook.com>
 <DB6PR05MB3223F6EA9E91F2564C24F5D5A1530@DB6PR05MB3223.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR05MB3223F6EA9E91F2564C24F5D5A1530@DB6PR05MB3223.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Apr 7, 2019 at 5:05 AM Liming Sun <lsun@mellanox.com> wrote:

> > > + * mlxbf_tmfifo_msg_hdr - Structure of the TmFifo message header
> > > + * @type: message type
> > > + * @len: payload length
> > > + * @u: 64-bit union data
> > > + */
> > > +union mlxbf_tmfifo_msg_hdr {
> > > +       struct {
> > > +               u8 type;
> > > +               __be16 len;
> > > +               u8 unused[5];
> > > +       } __packed;
> > > +       u64 data;
> >
> > I'm not sure I understand how you can distinguish which field of union to use?
> > Isn't here some type missed?
>
> Updated the comment in v14.
>
> This message header is a union of struct and u64 data.
> The 'struct' has
> type and length field which are used to encode & decode the message.
> The 'data' field is used to read/write the message header from/to the FIFO.

Something fishy here.

You are using a structure of data which you would like to write with
one call? Perhaps you need to construct this on-the-fly.
Moreover, the __be memeber is used in a data which is written as LE.
This needs more explanation.

-- 
With Best Regards,
Andy Shevchenko

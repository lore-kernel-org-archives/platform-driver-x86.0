From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Subject: Re: Add support for recent lenovo thinkpad HKEYS(Wifi/video swicth
 etc) buttons
Date: Thu, 15 Sep 2016 13:49:24 +0300
Message-ID: <CACaajQtkd9T=uK5A_EnxLdfjKeCzUZ4Nuz3zLbD1_OCAOoCrLA@mail.gmail.com>
References: <1473835500.3549.60.camel@infinera.com> <20160914115405.GA22341@kroah.com>
 <1473854415.3549.94.camel@infinera.com> <20160914143510.GB11149@kroah.com>
 <1473869643.3549.103.camel@infinera.com> <20160914170811.GA13294@kroah.com>
 <1473875861.3549.108.camel@infinera.com> <20160914181043.GA16177@kroah.com>
 <1473880067.3549.124.camel@infinera.com> <20160915055944.GB14085@kroah.com> <1473929506.3549.153.camel@infinera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1473929506.3549.153.camel@infinera.com>
Sender: stable-owner@vger.kernel.org
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "greg@kroah.com" <greg@kroah.com>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

2016-09-15 11:51 GMT+03:00 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>:
> Yes, but allowing new HW to work properly in older kernels was an exception or at least so I thought.
> If here is a new minor version of the e1000 ethernet device which needs a few tweaks to
> function on older kernels, do you not accept patches for that?


Why not add patches in you package and rebuild? I do this things often
and does not have any problems. You can use Fedora corp or opensuse
build service...

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru

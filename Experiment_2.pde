//SJF

Work[] work=new Work[4];
boolean SJF=false;
boolean work0=false;
boolean work1=false;
boolean work2=false;
boolean work3=false;


class Work
{
  PVector location;
  int r;
  char a;
  int rr, gg, bb;
  Work(char name, int x, int y, int priority, int w)
  {
    location=new PVector(x, y);
    r=priority;
    a=name;
    rr=w;
  }

  void display1()
  {
    fill(rr, 140, 110);
    rect(location.x, location.y, 65, 65);
    textSize(20); 
    fill(0);
    text(a, location.x+25, location.y+22);
    textSize(25);
    text(r, location.x+24, location.y+50);
  }  

  void display2()
  {
    fill(rr, 140, 110);
    rect(location.x, location.y+100, 65, 65);
    textSize(20); 
    fill(0);
    text(a, location.x+25, location.y+22+100);
    textSize(25);
    text(r, location.x+24, location.y+50+100);
  }
}

//only run one time
void setup() {
  size(800, 600);
  background(255, 204, 0);

  pushStyle();
  rect(700, 520, 65, 65);
  textSize(20);    
  fill(0);
  text("sort", 715, 557); 
  popStyle();

  pushStyle();
  rect(700, 430, 65, 65);
  textSize(20);    
  fill(0);
  text("SJF", 715, 467); 
  popStyle();

  pushStyle();
  fill(50, 190, 0);
  rect(30, 250, 72, 72);
  textSize(20);    
  fill(0);
  text("CPU", 45, 287); 
  popStyle();

  work[0]=new Work('A', 100, 50, 8, 0);  
  work[1]=new Work('B', 200, 50, 5, 145);   
  work[2]=new Work('C', 300, 50, 2, 210); 
  work[3]=new Work('D', 400, 50, 10, 255);
  for (int i=0; i<4; i++) {
    work[i].display1();
  }
  sort();
  work0=true;
}

//run repeatedly
void draw() {
}

void sort() {
  for (int i=3; i>0; --i) {
    for (int j=0; j<i; ++j) {
      if (work[j+1].r>work[j].r) {
        int tmp1=work[j].r;
        work[j].r=work[j+1].r;
        work[j+1].r=tmp1;

        char tmp2=work[j].a;
        work[j].a=work[j+1].a;
        work[j+1].a=tmp2;

        int tmp3=work[j].rr;
        work[j].rr=work[j+1].rr;
        work[j+1].rr=tmp3;
      }
    }
  }
}

void mouseClicked() {
  if (mouseX>700 && mouseX<765 && mouseY>520 && mouseY<585) {//sort
    sort();
    for (int i=0; i<4; i++) {
      work[i].display2();
    }
  }

  //SJF
  if (mouseX>700 && mouseX<765 && mouseY>430 && mouseY<495) {
    SJF=true;
  }
}

void keyPressed() {
  if (SJF) {
    if ((key == 'A')||(key == 'a')) {

      if (work[0].r>0 && work0 && !work1 && !work2 && !work3) {
        work[0].location.x+=(30-work[0].location.x);
        work[0].location.y+=(250-work[0].location.y-100);
        work[0].display2();
        work[0].r-=1;
        work0=true;
        work1=false;
        work2=false;
        work3=false;
      } else if (work[0].r<=0 ) {
        work[0].location.x+=(400-work[0].location.x);
        work[0].location.y+=(260-work[0].location.y);
        work[0].display2();
        work0=false;
        work1=true;
        work2=false;
        work3=false;
      }

      if (work[1].r>0 && work1 && !work0 && !work2 && !work3) {
        work[1].location.x+=(30-work[1].location.x);
        work[1].location.y+=(250-work[1].location.y-100);
        work[1].display2();
        work[1].r-=1;
        work0=false;
        work1=true;
        work2=false;
        work3=false;
      } else if (work[1].r<=0) {
        work[1].location.x+=(300-work[1].location.x);
        work[1].location.y+=(260-work[1].location.y);
        work[1].display2();
        work0=false;
        work1=false;
        work2=true;
        work3=false;
      }

      if (work[2].r>0 && work2 && !work0 && !work1 && !work3) {
        work[2].location.x+=(30-work[2].location.x);
        work[2].location.y+=(250-work[2].location.y-100);
        work[2].display2();
        work[2].r-=1;
        work0=false;
        work1=false;
        work2=true;
        work3=false;
      } else if (work[2].r<=0) {
        work[2].location.x+=(200-work[2].location.x);
        work[2].location.y+=(260-work[2].location.y);
        work[2].display2();
        work0=false;
        work1=false;
        work2=false;
        work3=true;
      }

      if (work[3].r>0 && work3 && !work0 && !work1 && !work2) {
        work[3].location.x+=(30-work[3].location.x);
        work[3].location.y+=(250-work[3].location.y-100);
        work[3].display2();
        work[3].r-=1;
        work0=false;
        work1=false;
        work2=false;
        work3=true;
      } else if (work[3].r<=0) {
        work[3].location.x+=(100-work[3].location.x);
        work[3].location.y+=(260-work[3].location.y);
        work[3].display2();
        work0=false;
        work1=false;
        work2=false;
        work3=false;
        pushStyle();
        fill(50, 190, 0);
        rect(30, 250, 72, 72);
        textSize(20);    
        fill(0);
        text("CPU", 45, 287); 
        popStyle();
      }
    }
  }
}